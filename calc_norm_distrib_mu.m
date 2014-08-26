function [mu, phi] = calc_norm_distrib_mu(mu_mean, variance, Eg, disc_mu)

if variance == 0
    mu = mu_mean;
    phi = 1;
    
else
    mu = 0.0:disc_mu:Eg;
    phi = 1/(variance*sqrt(2*pi)) * exp(-(mu - mu_mean).^2 / (2*variance^2)) * disc_mu;
end