clear
clc
close all

theta = 0:1:1000;
SF = zeros(1,length(theta));
u = zeros(1,length(theta));

for i = 1:length(theta)
    SF(i) = 2*(sind(i))^2+(cosd(i))^3;
    if SF(i) >= 0
        u(i) = 0;
    elseif SF(i) < 0
        u(i) = 1;
    end
end

yyaxis left
plot(theta,SF,'LineWidth',1), ylabel('Switching Function (SF)')
hold on
yline(0)
ylim([-1.5 2.5])
yyaxis right
plot(theta,u,'LineWidth',1), ylabel('Bang-Bang Control Value')
xlabel('Theta (\Theta)')
ylim([-0.5 1.5])
grid on 
title('Switching Function for 2sin^2(\Theta) + cos^3(\Theta)')