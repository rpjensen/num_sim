function [ a ] = mMenten1( x )
%

a = zeros(length(x),1);

nA = 6.023e23; % Avagadro?s number
vol = 1e-15; % volume of system
c(1) = 1e6/(nA*vol); 
c(2) = 1e-4; 
c(3) = 0.1;

a(1) = c(1)*x(1)*x(2);
a(2) = c(2)*x(3);
a(3) = c(3)*x(3);


end

