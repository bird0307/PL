function [y ty] = conv_m( x, tx, h, th, disc )
% Modified convolution routine for signal processing
%--------------------------------------------------------------------------
% [y ty] = conv_m( x, tx, h, th, disc )
% [y t] = convolution results
% [x tx] = first signal
% [h th] = second signal
%
tyb = tx(1) + th(1); tye = tx(length(x)) + th(length(h));
ty = [tyb:disc:tye]';
y = conv(x,h);