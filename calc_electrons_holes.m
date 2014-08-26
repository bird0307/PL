function [n_CB p_VB n_VB p_CB] = calc_electrons_holes( E, DOS, fn, fp, Ef )

% find number of columns in fn (and fp) as defined by chemical potentials
% in function calc_distribution function
[rows columns] = size(fn);

% calculate electron and hole densities according to quasi-Fermi
% distributions fn for electrons and fp for holes


n = repmat( DOS, 1, columns ) .* fn;
p = repmat( DOS, 1, columns ) .* fp;


dummy = (E >= Ef);
n_CB = n;
n_CB(~dummy,:) = 0;

p_CB = p;
p_CB(~dummy,:) = 0;

n_VB = n;
n_VB(dummy,:) = 0;

p_VB = p;
p_VB(dummy,:) = 0;
