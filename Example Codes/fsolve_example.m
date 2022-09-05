clear
clc
close all

x = linspace(-5,5,1000);

for i = 1:length(x)
C1(i) = x(i)^2-5;
C2(i) = -3*x(i)^2+2;
end

%% Intersection

F = @LineFunc;
x0_1 = [-1,0,1,0];
[Inter1,FVal1,exitflag1,output1]=fsolve(F,x0_1);
x1 = Inter1(1);
y1 = Inter1(2);
x2 = Inter1(3);
y2 = Inter1(4);

%% Plots
plot(x,C1)
hold on
plot(x,C2)
plot(x1,y1,'k+','LineWidth',1.5)
plot(x2,y2,'k+','LineWidth',1.5)
grid on
xlabel('x'); ylabel('y')
title('Intersection Between 2 Equations')
legend('y=x^2-5','y=3x^2+2','Intersection Points','Location','best')

%% Outputs
fprintf('Intersection Points: (%f,%f)\n',x1,y1);
fprintf('Intersection Points: (%f,%f)\n',x2,y2);
 
function y = LineFunc(x)
y(1) = x(1)^2-5-x(2);
y(2) = -3*x(1)^2+2-x(2);
y(3) = x(3)^2-5-x(4);
y(4) = -3*x(3)^2+2-x(4);
end