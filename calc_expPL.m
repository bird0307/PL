function PL = calc_expPL(mu_mean,variance,E0,M,E_exp,T,d)


[Eph PL] = calc_PL_spectrum(mu_mean, variance, E0, M, T, d);

PL = interp1(Eph,PL,E_exp);

end