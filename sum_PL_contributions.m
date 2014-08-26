function PL = sum_PL_contributions(rsp,phi,d)

[rows_PL columns_PL] = size(rsp);
sqcm2sqm = 1E4;
phi_mod = repmat(phi,rows_PL,1);
PL = sqcm2sqm * d * rsp .* phi_mod;
PL = sum(PL,2);

end