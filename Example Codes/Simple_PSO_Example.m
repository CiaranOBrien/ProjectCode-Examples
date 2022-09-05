clear
clc
close all
format longG

%% Define Function

fun = @PSOTestFunction; % See Function Below

%% Set Lower and Upper Bound

lb = -2*pi; % Lower Bound
ub = 2*pi; % Upper Bound

%% Initilisation

rng default % For Reproducibility
nvars = 1; % Number of Variables

options = optimoptions('particleswarm','SwarmSize',1000,'HybridFcn',@fmincon); % PSO Options

[OptimalLocation,fval,exitflag,output] = particleswarm(fun,nvars,lb,ub,options); % PSO 

%% Plot of Function

x1 = OptimalLocation(1);
x3 = fval;

figure('Name','Optimisation Plot','NumberTitle','off') 
k = -2*pi:0.1:2*pi;
eq = (4*k.^2)+5*k-10;
plot(k,eq)
title('f(x) = 4x^2+5x-10')
xlabel('x');
ylabel('f(x)');
grid on

hold on 
plot(x1,x3,'r.','MarkerSize',20)

legend('Function','Minimum Point','Location','best')

%% Function

function [y] = PSOTestFunction(A)
x = A(1);
y = (4*x^2)+5*x-10;
end