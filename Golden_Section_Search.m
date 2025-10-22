%Determine f(x)= -x^2-6x-5 (Parabolic function)
%This code you can applied for maximum or minimum value if you change a
%function

clc,clear;

% Define the function f(x)
%f = @(x) -x.^2 - 6*x - 5; %maximum
f = @(x) x.^2 + 6*x + 5; %minimum

% initial value
xl = -5;
xu = -1;

R = (sqrt(5)-1)/2;
d= R*(xu-xl);

x1 = xl+d;
x2 = xu-d;

f_x1 = f(x1); %f1
f_x2 = f(x2); %f2
%f_x1=-x1.^2 - 6*x1 - 5;
%f_x2=-x2.^2 - 6*x2 - 5;

Es = 1e-3; % Desired relative error tolerance
Ea = 100; % Initial relative error (set high to start iteration)
iter =0;
    
while Ea>Es
    iter = iter+1;
    
    %if f_x1>f_x2 %maximum
    if f_x1<f_x2 %minimum
        xl = x2;
        x2 = x1;
        x1 = xl+ R * (xu - xl);
        f_x2 = f_x1;
        %f_x1= -x1.^2 - 6*x1 - 5;
        f_x1= f(x1); 
    else
        xu=x1;
        x1=x2;
        x2=xu- R * (xu - xl);
        f_x1 = f_x2;
        %f_x2 = -x2.^2 - 6*x2 - 5;
        f_x2 = f(x2);
    end 
    
     % Calculate the approximate error
    Ea = abs((xu - xl) / ((xu + xl) / 2)) * 100;
    
    % Display iteration details
    fprintf('Iteration: %d, x1 = %g, x2 = %g, Ea = %g\n', iter, x1, x2, Ea);
end

x_opt = (xl + xu) / 2; 
%f_opt = -x_opt.^2 - 6*x_opt - 5;
f_opt = f(x_opt);
fprintf('\nOptimal x = %g, f(x) = %g after %d iterations\n', x_opt, f_opt, iter);
