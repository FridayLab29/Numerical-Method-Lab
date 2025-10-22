clc,clear

% Parameters
t0 = 0;          % Initial time
tf = 5;          % Final time
y0 = 1;          % Initial condition
h = 0.1;         % Step size
N = (tf - t0)/h; % Number of steps

% Define dy/dt = -2y <- Your Differential Equation
f = @(t, y) -2*y;

% Initialize variables
t = t0:h:tf;
y = zeros(1, N+1);
y(1) = y0;

for i = 1:N
    ti = t(i);
    yi = y(i);
    
    k1 = h * f(ti, yi);
    k2 = h * f(ti + h/4, yi + k1/4);
    k3 = h * f(ti + h/4, yi + k1/8 + k2/8);
    k4 = h * f(ti + h/2, yi - k2/2 + k3);
    k5 = h * f(ti + 3*h/4, yi + (3*k1)/16 + (9*k4)/16);
    k6 = h * f(ti + h, yi - (3*k1)/7 + 2*k2 + (12*k3)/7 - (12*k4)/7 + (8*k5)/7);
    
    y(i+1) = yi + (7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6)/90;
end

% Plot the solution
plot(t, y, 'b-o');
xlabel('Time (t)');
ylabel('Solution (y)');
title('Solution of dy/dt');
grid on;