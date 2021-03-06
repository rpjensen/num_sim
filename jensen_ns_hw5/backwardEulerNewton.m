function [ ynplus1 ] = backwardEulerNewton(yn,tnplus1,h,f,J)
    %Newton's method for Backward Euler (single variable case)
    %yn is the numerical solution of y at step number n
    %tnplus1 is the time t at the step we're computing
    %h is the stepsize used
    %f is the RHS function of the original ODE: y' = f(t,y)
    %J is the Jacobian (derivative) of f
    % returns ynplus1, the next step in the Backward Euler method
TOL = 1e-3;
MAX_STEPS = 10;

step = 0;
ynplus1 = yn;
ynplus1Next = ynplus1;
err = Inf;

while step < MAX_STEPS && err > TOL
    ynplus1 = ynplus1Next;
    
    ynplus1Next = ynplus1 - ((eye(length(yn)) - h*J(tnplus1, ynplus1))^(-1))*(ynplus1 - yn - h*f(tnplus1, ynplus1));
    %disp(ynplus1Next); % Print each iteration
    step = step + 1;
    err = norm(ynplus1Next-ynplus1);
end

if err > TOL && step > 0
   fprintf('This function and initial condition didn''t converge in %f\n', MAX_STEPS); 
end

ynplus1 = ynplus1Next;

end