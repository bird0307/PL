function value = cost_PL(fit_parameter,T,d,E_exp,PL_exp)

mu_mean = fit_parameter(1);
variance = fit_parameter(2);
E0 = fit_parameter(3);
M = fit_parameter(4);

PL = calc_expPL(mu_mean,variance,E0,M,E_exp,T,d);



%value = sqrt(1/length(E_exp)*sum((log(PL_exp)-log(PL)).^2));

value = sqrt(1/length(E_exp)*sum((log(PL_exp)-log(PL)).^2));