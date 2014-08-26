function [E fn fp Ef] = calc_distribution_function( mu, T, Eg, sigma_n_CB, sigma_p_CB, sigma_n_VB, sigma_p_VB, E, constant )

EC = 0;
EV = EC - Eg;

% calculate equilibrium Fermi-level Ef; for symmetric DOS Ef is midgap
Ef = (EV + EC)/2;

% calculate quasi-Fermi levels from chemical potential of electron hole
% ensemble, for symmetric DOS it equal for electrons and holes and given by
% mu/2
Efn = Ef + mu/2;
Efp = Ef - mu/2;

% effective density of states
Neff = 1E21;

% free electron density in CB
n = Neff*exp((Efn-EC)/constant.k/T);
% free hole density in VB
p = Neff*exp((EV-Efp)/constant.k/T);


% initialize vector for capture cross sections
sigma_n = zeros(length(E),1);
sigma_p = zeros(length(E),1);

% find all indexes in E-vector with energies >= Ef and store
% indices in dummy1
dummy1 = (E >=  Ef );
% set sigma_n to corresponding values sigma_n_CB for CB side and sigma_n_VB
% for VB side
sigma_n(dummy1) = sigma_n_CB;
sigma_n(~dummy1) = sigma_n_VB;
% set sigma_p to corresponding values sigma_p_CB for CB side and sigma_p_VB
% for VB side
sigma_p(dummy1) = sigma_p_CB;
sigma_p(~dummy1) = sigma_p_VB;


% help variables
n_bar = constant.v*sigma_n*n;
p_bar = constant.v*sigma_p*p;
% emission rates e_n and e_p for electrons and holes
e_n = repmat( constant.v.*sigma_n.*Neff.*exp((E-EC)/constant.k/T), 1, length(mu)); %.* ones(length(E),length(mu));
e_p = repmat( constant.v.*sigma_p.*Neff.*exp((EV-E)/constant.k/T), 1, length(mu));


% modified quasi-Fermi distribution according to Simmons and Taylor
fn = (n_bar + e_p)./(e_n+n_bar+p_bar+e_p);
fp = (p_bar+e_n)./(e_n+n_bar+p_bar+e_p);