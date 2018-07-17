clc
clear all
close all

toAng = @(argV, argVpi) (((1/argVpi)*(pi/2)).*argV);


Vpi = 4;    % Value of Vpi
toA = @(argV)   toAng(argV, Vpi);


% LO stage
% the values are all fixed ... and unchanged
Vlo = 0.5;
A = toA(Vlo);

% for RF stage
Vrf = 0:0.1:Vpi; % the range of RF voltages
B = toA(Vrf);

% after photodiode
R = 0.82;       % responsivity of Photodiode

Plaser_dbm = 0; % laser power in dbm
Pin = 10^(Plaser_dbm/10-3);    % power 


factor0 = @(a,b) (besselj(0,a).^2 .* besselj(0,b).^2 ...
    +2*besselj(1,a).^2 .* besselj(0,b).^2 ...
    +2*besselj(0,a).^2 .* besselj(1,b).^2 ...
    +4*besselj(1,a).^2 .* besselj(1,b).^2); 

L0 = 1;         % link gain
Idc = (L0*Pin/4) * factor0(A,B).^2;


