function test_DOS
Eg = 1.4;
N0 = 2E21;
Etail = 20E-3;
E0 = 40E-3;
Emin = -3.0;
Emax = 2.0;
disc = 1E-4;

[E DOS] = construct_DOS( Eg, N0, Etail, E0, Emin, Emax, disc );

plot(E,DOS)