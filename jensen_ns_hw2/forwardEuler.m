function [t, y] = forwardEuler(f,h,t0,tfinal,y0)
% f(t, y) = y'
% h is step size
% t0 is inital time
% tfinal is final time
% y0 = y(t0) initial condition

    % (1-0)/.1 = 10 [.1,.2,.3,.4,.5,.6,.7,.8,.9,1.0]
    % (.95-0)/.1 = 9.5 [.1,.2,.3,.4,.5,.6,.7,.8,.9,.95]
    % (1.05-0)/.1 = 10.5 [.1,.2,.3,.4,.5,.6,.7,.8,.9,1.0,1.05]
    steps = ceil((tfinal - t0) / h); % get the number of steps in the process
    
    % If there is only 1 step make sure h is appropriately sized
    if steps == 1
        h = tfinal-t0;
    end
    
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
        % Use the formula to find the next y value
        yNext = yCur + h .* f(tCur,yCur);
        % update the current time for the next step
        tCur = tCur + h;
        % adjust the step so that we don't overshoot the last time
        h = min(h, tfinal-tCur);
        
        % set the output values with the current time and computed y
        t(i+1,1) = tCur;
        y(i+1,:) = yNext;
        % set up the next iteration
        yCur = yNext;
    end
    
    % Make sure we didn't over shoot the last time value
    t(steps+1,1) = tfinal;
    
    
    
end