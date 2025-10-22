% This code **is used for** (or **solves**) Systems of Linear Equations.
% You can define your own system, or **uncomment** an example system in this code to run it.

%Detemine f(x)
% 7x1+x2+5x3 =27
% 4x1+3x2+5x3=21
% 6x1+x2+2x3=9
% x1=0, x2=-3, x3=6 - function 1 

% 2v+w+x+y+z = 4
% v+2w+x+y+z = 5
% v+w+2x+y+z = 6
% v+w+x+2y+z = 7
% v+w+x+y+2z = 8 - function 2 


clc,clear
%Forward elimination 
%a=[7 1 5;4 3 5; 6 1 2;];
a=[2 1 1 1 1; 1 2 1 1 1; 1 1 2 1 1; 1 1 1 2 1; 1 1 1 1 2 ];
%b=[27; 21; 9];
b=[4; 5; 6; 7; 8;];
n=length(a);
for k=1: n-1
    for i=k+1:n
        factor=a(i,k)/a(k,k);
        for j=k+1:n
            a(i,j)=a(i,j)-factor*a(k,j);
        end
        b(i)=b(i)-factor*b(k);
    end
end

%backward substitution
x(n)=b(n)/a(n,n)
for i=n-1:-1:1
    sum=b(i);
    for j=1+1:n
        sum=sum-a(i,j)*x(j);
    end
 x(i)=sum/a(i,i)
end