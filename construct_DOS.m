function [E DOS] = construct_DOS( Eg, N0, Etail, E0, Emin, Emax, disc )
% constructs the density of states DOS as a function of the energy E
% input parameters:
% Eg...band gap
% N0...parabolic bands prefactor (equal for conduction and valence band)
% Etail...connection point between parabolic bands and exponential tail
% E0...characteristic band tail energy
% Emin...minimum energy (well below valence band edge)
% Emax...maximum energy (well above conduction band edge)

E = (Emin : disc : Emax)'; % energy vector
EC = 0; % conduction band edge
EV = EC - Eg; % valence band edge

% conduction band side
% calculate DOS at connection point between parabolic band and exponential tail
NC0tail = N0 * sqrt( Etail - EC )
% find all indexes in E-vector with energies <= (Etail - EC) and store
% indices in dummy1
dummy1 = (E <=  Etail - EC );
% calculate exponential DOS on CB side, use logical array dummy1 to
% extract corresponding indices of E-vector
NCBT = NC0tail * exp(-(Etail-E(dummy1))/E0);
% indices of all energies with energies > (Etail - EC) are given as logical
% negation of dummy1
dummy2 = ~dummy1;
% calculate parabolic DOS
NC0 = N0 * sqrt( E(dummy2) );

DOS_CB = [NCBT;NC0];


% valence band side
% calculate DOS at connection point between parabolic band and exponential tail
NV0tail = N0 * sqrt( -(EV + Eg - Etail) )
% find all indexes in E-vector with energies >= (EV - Etail) and store
% indices in dummy1
dummy1 = (E >=  EV - Etail );
% calculate exponential DOS on VB side, use logical array dummy1 to
% extract corresponding indices of E-vector
NVBT = NV0tail * exp(-(E(dummy1) - EV + Etail)/E0);

% indices of all energies with energies < (EV - Etail) are given as logical
% negation of dummy1
dummy2 = ~dummy1;
% calculate parabolic DOS
NV0 = N0 * sqrt( EV - E(dummy2) );


%semilogy(E(dummy1),NVBT,E(dummy2),NV0)
DOS_VB = [NV0;NVBT];

DOS = DOS_VB;