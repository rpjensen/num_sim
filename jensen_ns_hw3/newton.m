function [ curSol ] = newton( x0, f, df )
% Solve for zero using newtons method where x0 is initial guess, f is the
% function to solve, and df is the derivative of the function wrt the
% independant variable.

TOL = 1e-5;
MAX_STEPS = 10;

step = 0;
lastSol = 2*TOL+x0;
curSol = x0;

while step < MAX_STEPS && abs(lastSol-curSol) > TOL
    lastSol = curSol;
    
    curSol = lastSol - f(lastSol)./df(lastSol);
    
    step = step + 1;
end

if abs(lastSol-curSol) > TOL
   disp('This function and initial condition didn''t converge in %f\n', MAX_STEPS); 
end

end

