data = dlmread('C:\Users\Sven\Dropbox\ausarbeitung\bilder\mucSi\mucSi_PL\experiment\SG007\annealed\SG007_annealed_532nm@10mW_InGaAs_130K_00_spectral_PLYield.txt');

min_energy_index = 77;
max_energy_index = 20;


E_exp = data(max_energy_index:min_energy_index,1);
PL_exp = data(max_energy_index:min_energy_index,2);

mu_mean = 0.85;
variance = 35e-3;
E0 = 40e-3;
M = 1e-27;
fit_parameter0 = [mu_mean, variance, E0, M];


T = 130;
d = 200e-7;






    
value = cost_PL(fit_parameter0,T,d,E_exp,PL_exp)
options = optimset('MaxIter',5000,'MaxFunEvals',5000,'Display','final','TolX',1e-6,'TolFun',1e-6);

tic
[parameters, fval] = fminsearch(@(fit_parameter)cost_PL(fit_parameter,T,d,E_exp,PL_exp),fit_parameter0,options)
toc


mu_mean = parameters(1)
variance = parameters(2)
E0 = parameters(3)
M = parameters(4)
PL = calc_expPL(mu_mean,variance,E0,M,E_exp,T,d);

semilogy(E_exp,PL_exp,'o',E_exp,PL,'r')