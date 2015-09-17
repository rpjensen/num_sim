function [ dY ] = spruceSystem( ~, Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

p = Y(1);
k = Y(2);
r = .55;
c = .5;

dY = zeros(2,1);

dY(1) = r*p*(1-p/k) - (p^2)/(1+p^2);
dY(2) = 1 - c*p;


end

