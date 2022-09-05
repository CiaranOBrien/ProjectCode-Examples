clear
clc
close all
format longG

%% Define Function

fun = @PSOTestFunction; % See Function Below

%% Set Lower and Upper Bound

lb = [-2*pi,-2*pi]; % Lower Bound
ub = [2*pi,2*pi]; % Upper Bound

%% Initilisation

rng default % For Reproducibility
nvars = 2; % Number of Variables

options = optimoptions('particleswarm','SwarmSize',1000,'HybridFcn',@fmincon); % PSO Options

[OptimalLocation,fval,exitflag,output] = particleswarm(fun,nvars,lb,ub,options) % PSO 

%% Plot of Function

x1 = OptimalLocation(1);
x2 = OptimalLocation(2);
x3 = fval;

figure('Name','Optimisation Plot','NumberTitle','off') 
fsurf(@(x,y) y.*sin(x)-x.*cos(y),[-2*pi 2*pi])
title('z = ysin(x) - xcos(y)')
xlabel('x');
ylabel('y');
zlabel('z');
box on

hold on 
plot3(x1,x2,x3,'r.','MarkerSize',20)

legend('Function','Minimum Point')

%% Function

function [z] = PSOTestFunction(A)
x = A(1);
y = A(2);
z = y*sin(x)-x*cos(y);
end
