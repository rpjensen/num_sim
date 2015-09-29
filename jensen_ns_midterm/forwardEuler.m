function [y] = forwardEuler(f,h,t0,y0)
% f(t, y) = y'
% h is step size
% t0 is inital time
% y0 = y(t0) initial condition
    
    [m,n] = size(y0);
    
    if m < n
       y0 = y0'; 
    end
    
    
    % ---Formula---
    % y(n+1) = y(n) + h f(t(n),y(n))
    y1 = y0 + h .* f(t0, y0); 
    
    y = y1;

end