% Determine f(x) = x^2+3x-9, xl=-1, xu=5
clc,clear;

% Given values
xl = -1;
xu = 5;
Es = 1e-3; % Desired relative error tolerance
Ea = 100; % Initial relative error (set high to start iteration)
x_old = xu; % Initial guess for the root

% Function values at initial guesses
f_xl = xl^2 + 3*xl - 9;
f_xu = xu^2 + 3*xu - 9;


if f_xl * f_xu < 0
    disp('False-Position Method')
end

iter = 0; % iter = iteration

% Iteration loop
while Ea > Es
    iter = iter + 1;
 
    x = xu - ((f_xu * (xu - xl)) / (f_xu - f_xl));
    f_x = x^2 + 3*x - 9;
    
    % Condition Check
    if f_xl * f_x < 0
        xu = x;
        f_xu = f_x;
    elseif f_xl * f_x > 0
        xl = x;
        f_xl = f_x;
    else
        xr=x;
    end
    
    % Calculate relative error
    Ea = abs((x - x_old) / x) * 100;
    x_old = x; % Update old root estimate
    
    fprintf('Iteration: %g, xr = %g, f(xr) = %g, Ea = %g\n', iter, x, f_x, Ea);
end

fprintf('\nRoot found at xr = %g with f(xr) = %g after %g iterations\n', x, f_x, iter);
