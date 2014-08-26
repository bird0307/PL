function [Eph rsp alpha] = calc_emission_absorption_rates( n_CB, p_VB, n_VB, p_CB, E, M, eta, disc, constant )

[rows columns] = size(n_CB);
rsp_m = zeros(2*rows-1,columns);

for index = 1 : columns
    [rsp_m(:,index) Eph] = conv_m( flipud(p_VB(:,index)), -flipud(E), n_CB(:,index), E, disc );
end
D_gamma = eta^3*Eph.^2/(pi^2*constant.hbar^3*constant.c^3);

rsp = M * repmat( D_gamma, 1, columns ) .* rsp_m * disc;

ra = zeros(2*rows-1,columns);

for index = 1 : columns
    [ra_m(:,index) Eph] = conv_m( flipud(n_VB(:,index)), -flipud(E), p_CB(:,index), E, disc );
end

alpha = M * ( ra_m - rsp_m ) * eta/constant.c * disc;


