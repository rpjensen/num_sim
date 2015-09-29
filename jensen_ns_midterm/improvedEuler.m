function [y] = improvedEuler(f,h,t0,y0)
% f(t, y) = y'
% h is step size
% t0 is inital time
% y0 = y(t0) initial condition
    
    [m,n] = size(y0);
    
    if m < n
       y0 = y0'; 
    end
    
    
    t1 = t0+h;
    % ---Formula---
    % y~(n+1) = y(n) + h f(t(n),y(n))
    % y(n+1) = y(n) + h/2 (f(t(n),y(n))+f(t(n+1), y~(n+1)))
    y1T = y0 + h .* f(t0, y0); % T as in tilde
    y1 = y0 + h/2.*(f(t0,y0)+f(t1, y1T));
    
    y = y1;
end