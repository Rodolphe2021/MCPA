set(0,'DefaultFigureWindowStyle','docked')
set(0,'Defaultaxesfontsize',20)
set(0,'Defaultaxesfontname','Times New Roman')
set(0,'Defaultlinelinewidth',2)

clear all
close all

x = 0;
xt = 0;
v = 0;
t = 0;
f = 1;
m = 1;

dt = 1;
nt = 1000;

v = zeros(np,1);
x = zeros(np,1);
re = 0;
% re = -1;

for i = 2:nt
t(i) = t(i-1)+dt;
v(:,1)= v(:,i-1)+ F/m+dt;
x(:,i)= x(:,i-1)+ v(:,i-1)*dt+ F/m+dt^2/2;

r = rand(np,1) < 0.5;
v(r,i) = re+v(r,i);
averageV(i,:) = mean(v,2);

subplot(3,1,1),plot(t,v,' ');hold on
subplot(3,1,1),plot(t,averageV,'g');
hold off

xlabel('time')
ylabel('v')
title(('Average v:' num2str(averageV(i))))
subplot(3,1,2),plot(x(1,:),v(1,:),'r');

subplot(3,1,2),plot(x(1,:),averageV,'g');
hold off
xlabel('x')
ylabel('v')

subplot(3,1,3),plot(t,x,' ');
xlabel('time')
ylabel('x')

pause(0.01)


end

display('Average V')
mean(v)


