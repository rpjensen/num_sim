function [t y] = forwardEuler(f,h,t0,y0)
    % [NOTE: This code is adapted from your working FE with tFinal removed and
    % steps = 1]
    
    % let's create t first
    t = [t0 t0+h]';
    
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
    
    % try one step
%     yold = y(1,:)';% make column vector for notational consistency
%     h = t(2)-t(1);
%     ynew = yold + h*f(0,yold);
%     y=[y;ynew']

    %loop
    for i=2:length(t)
        yold = y(i-1,:)';% make column vector for notational consistency
        h = t(i)-t(i-1);
        ynew = yold + h*f(t(i-1),yold);
        y=[y;ynew'];
    end
    
    t = t(end,1);
    y = y(end,:);

end