function [ T, Y, stepSizes ] = rk12( f, times, y0, TOL )

LOW_TOL = 0.8*TOL;% the bound at which we increase h

TIME_TOL = 1e-6;

h = (times(end)-times(1))/20;% init step size
t = times(1);% init t
y = y0;% init y

T = times;% output T
Y = zeros(length(T), 1);% output Y (1 to 1 with T)
Y(1) = y;
stepSizes = zeros(1,2);% (ti,hi) pairs for each accepted step (dynmaic size)

timeCounter = 2;% the index into the time array
stepCounter = 1;% the index into the steps array

while (t < times(end))
    % h is the min of h and the distance to the next fence post
    h = min(h, times(timeCounter)-t);
    
    % calculate fe and ie at this step
    fe = forwardEuler(f,h,t,y);
    ie = improvedEuler(f,h,t,y);
    
    % calculate iffy error
    err = 1.5*abs(ie-fe);
    
    if (err > TOL)
        % bad step reduce h for the next step
       h = h/2;
    else 
        % good step record the time, stepsize pair in our steps matrix
        stepSizes(stepCounter,:) = [t h];
        stepCounter = stepCounter + 1;
        
        % update t and y for the next step
        t = t+h;
        y = ie;
        
        if abs(t - times(timeCounter)) < TIME_TOL
           % need to record the value we found since this is at one of our
           % fence posts
           Y(timeCounter) = y;
           t = times(timeCounter);
           timeCounter = timeCounter + 1;
        end
        if err < LOW_TOL
            % really good step, make h a little bigger
            h = h * sqrt(TOL/err);
        end
    end
    
end


end

