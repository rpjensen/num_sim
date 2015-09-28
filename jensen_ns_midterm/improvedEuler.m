function [t, y] = improvedEuler(f,h,t0,y0)
% f(t, y) = y'
% h is step size
% t0 is inital time
% y0 = y(t0) initial condition
    
    % [NOTE: This code is adapted from my working IE with tFinal removed and
    % steps = 1]
    [m,n] = size(y0);
    
    if m < n
       y0 = y0'; 
    end
    
    % (1-0)/.1 = 10 [.1,.2,.3,.4,.5,.6,.7,.8,.9,1.0]
    % (.95-0)/.1 = 9.5 [.1,.2,.3,.4,.5,.6,.7,.8,.9,.95]
    % (1.05-0)/.1 = 10.5 [.1,.2,.3,.4,.5,.6,.7,.8,.9,1.0,1.05]
    steps = 1;
    
    
    % Set the current time and current y value to be the initial condition
    tCur = t0;
    yCur = y0;
    
    % Initialize the size of the time and y output (one row for each time,
    % one column for each variable of y)
    t = zeros(steps+1,1);
    y = zeros(steps+1,length(y0));
    
    % Set the output variable to match the initial condition
    t(1,1) = t0;
    y(1,:) = y0;
    
    
    
    for i = 1:steps
        tNext = tCur+h;
        % ---Formula---
        % y~(n+1) = y(n) + h f(t(n),y(n))
        % y(n+1) = y(n) + h/2 (f(t(n),y(n))+f(t(n+1), y~(n+1)))
        yNextT = yCur + h .* f(tCur, yCur); % T as in tilde
        yNext = yCur + h/2.*(f(tCur,yCur)+f(tNext, yNextT));
        t(i+1,1) = tNext;
        y(i+1,:) = yNext;
        
        tCur = tNext;
        yCur = yNext;
        
    end
    t = t(end,1);
    y = y(end,:);
end