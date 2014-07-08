function [E n_PL p_PL] = calc_electrons_holes( E, DOS, sigma_n_CB, sigma_p_CB, sigma_n_VB, sigma_p_VB )


% physical constants used in calculation
c = 3E10;   % vacuum speed of light in cm/s
k = 8.617E-5;  % Boltzmann's constant in eV/K
h = 4.135E-15;  % Planck's constant in eV*s
hbar = h/2/pi;  % reduced Planck constant in eV*s
v = 1E7;        % thermal velocity in cm/s