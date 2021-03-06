function [Eph PL] = test_DOS

constant.c = 3E10;   % vacuum speed of light in cm/s
constant.k = 8.617E-5;  % Boltzmann's constant in eV/K
constant.h = 4.135E-15;  % Planck's constant in eV*s
constant.hbar = constant.h/2/pi;  % reduced Planck constant in eV*s
constant.v = 1E7;        % thermal velocity in cm/s


Eg = 1.4;
N0 = 2E21;
Etail = 20E-3;
E0 = 40E-3;
Emin = -2.0;
Emax = 2.0;
disc = 5E-3;

tic
[E DOS] = construct_DOS( Eg, N0, Etail, E0, Emin, Emax, disc );



disc_mu = 1e-2;
mu_mean = 1.0;
mu = 0.0:disc_mu:Eg;
variance = 30e-3;
FWHM = 2*sqrt(2*log(2))*variance
sig = FWHM/(2*sqrt(2*log(2)))
T = 20;
sigma_n_CB = 1E-16;
sigma_n_VB = 1E-15;
sigma_p_CB = 1E-15;
sigma_p_VB = 1E-16;

[mu phi] = calc_norm_distrib_mu(mu_mean, variance, Eg, disc_mu);
sum(phi)
plot(mu,phi)


[E fn fp Ef] = calc_distribution_function( mu, T, Eg, sigma_n_CB, sigma_p_CB, sigma_n_VB, sigma_p_VB, E, constant );


% electron and hole density 

[n_CB p_VB n_VB p_CB] = calc_electrons_holes( E, DOS, fn, fp, Ef );



M = 2E-31;
eta = 3.;


[Eph rsp alpha] = calc_emission_absorption_rates( n_CB, p_VB, n_VB, p_CB, E, M, eta, disc, constant );




d = 200E-7;

PL = sum_PL_contributions(rsp,phi,d);

toc
semilogy(Eph,PL)
