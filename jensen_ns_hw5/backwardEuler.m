function [t y] = backwardEuler(f,J,h,t0,tfinal,y0)
    % backwardEuler for function of single variable
    % uses backwardEulerNewton
    %
    % f is right-hand side funtion in y' = f(t,y)
    % J is a function for the partial derivative of f with respect to y
    % h is the step size
    % t0 is the initial time
    % tfinal is the end time
    % y0 is the initial condition, y(0) = y0
    
    % your code goes here
    % let's create t first
    t = (t0:h:tfinal)';
    % if tfinal is not divisible by h, the last element in t will
    % be smaller than tfinal, so append tfinal:
    if (t(end)<tfinal)
        t=[t; tfinal];
    end
    
    if (length(t)==1)
       error('Invalid h, t0, and/or tfinal: no steps executed') 
    end
    
    % if y0 is a row vector, make it a column vector
    if (isrow(y0))
       y0 = y0'; 
    end
    % check if valid
    if ~iscolumn(y0)
        error('Invalid input vector y0');
    end
    % y0 is a COLUMN vector but we want to store as rows in output
    % matrix y
    y=y0';
    
    %loop
    for i=2:length(t)
        yold = y(i-1,:)';% make column vector for notational consistency
        h = t(i)-t(i-1);
        ynew = backwardEulerNewton(yold, t(i), h, f, J) ;
%         ynew = yold + h*f(t(i-1),yold);
        y=[y;ynew'];
    end

end