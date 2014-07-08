function test_DOS
Eg = 1.4;
N0 = 2E21;
Etail = 20E-3;
E0 = 40E-3;
Emin = -3.0;
Emax = 2.0;
disc = 1E-3;

tic
[E DOS] = construct_DOS( Eg, N0, Etail, E0, Emin, Emax, disc );
toc

mu = 0.8;
T = 300;
sigma_n_CB = 1E-16;
sigma_n_VB = 1E-15;
sigma_p_CB = 1E-15;
sigma_p_VB = 1E-16;

tic
[E fn fp Ef] = calc_distribution_function( mu, T, Eg, sigma_n_CB, sigma_p_CB, sigma_n_VB, sigma_p_VB, E );
toc


tic
[n_CB p_VB n_VB p_CB] = calc_electrons_holes( E, DOS, fn, fp, Ef );
toc



plot(E,n_CB,'b',E,p_VB,'r')