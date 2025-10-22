function integral = simpsons_rule(x, fx)

    %input value
    %x - Vector of x values (number of area point)
    %fx - function for find approximate intergral value


    %output value 
    %integral - The approximate integral value

    if mod(length(x) - 1, 2) ~= 0
        error('Simpson''s rule requires an even number of subintervals. The length of x must be odd.');
    end

    
    n = length(x) - 1; % Number of subintervals
    h = (max(x) - min(x))/n;
    
    sum = fx(1);       % Initialize sum with the first term
    
    for i = 2:2:n-2
        sum = sum + 4 * fx(i) + 2 * fx(i+1);
    end
    
    sum = sum + 4 * fx(n) + fx(n+1);
    
    integral = (h / 3) * sum;
    
end

%Remark: You should save the script of this function in the same path of your work.
%Example for using, if the function is f(x)=x.^2
%x = 0:0.1:2;
%fx=x.^2;
%integral = simpsons_rule(x, fx) <- function require
%integral =

%   2.6667 <- Answer of this Method