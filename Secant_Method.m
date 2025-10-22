% Determine f(x) = exp(-x)-x, xi-1=0 determine x , xi=1 determine xi
clc,clear;

% Given values
x = 0.0; % Initial guess x(i-1)
xi = 1.0; % Initial guess x(i)
Es = 1e-3; % Desired relative error tolerance
Ea = 100; % Initial relative error (set high to start iteration)
iter = 0; % Iteration counter

% Function values at initial guesses
f_x = exp(-x) - x;
f_xi = exp(-xi) - xi;

disp('Secant Method')

% Iteration loop
while Ea > Es
    iter = iter + 1;
    
    % Secant method formula 
    xii = xi - (f_xi * (x - xi)) / (f_x - f_xi);
    
    % Calculate relative error
    Ea = abs((xii - xi) / xii) * 100;
    
    % Update for next iteration
    x = xi;
    xi = xii;
    
    % Update function values
    f_x = f_xi;
    f_xi = exp(-xi) - xi;
    
    fprintf('Iteration: %g, x = %g, Ea = %g\n', iter, xii, Ea);
end

% Display final results
fprintf('\nRoot found at x = %g after %d iterations\n', xii, iter);