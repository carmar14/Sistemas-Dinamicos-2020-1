clc
clear
close all

%Parámetros
global m l k g
m=1;
l=0.5;
k=100;

g=9.8;

x0=[0.5, 0, pi/8, 0];
% x0=[0.9, 0, pi/6, 0];
% x0=[0.5, 0, 3.1, 0];
t=0:4e-3:10;

[t,y]=ode45(@pendulo_resorte_nl,t,x0);

[m1 n]=size(y);
figure
for i=1:n
    subplot(n,1,i)
    
    plot(t,y(:,i))
end

%animacion
figure
r=y(:,1);
theta=y(:,3);
xpos=r.*sin(theta);
ypos=-r.*cos(theta);
for i=1:m1
    x_b=[0 xpos(i)];
    y_b=[0 ypos(i)];
    plot(x_b,y_b,'b')
    hold on
    plot(xpos(1:i),ypos(1:i),'.b')
    plot(x_b(2),y_b(2),'.b','MarkerSize',30)
    hold off
%     xlim([min(xpos) max(xpos)])
%     ylim([min(ypos) 0])
    xlim([min(xpos)-0.1 0.1+max(xpos)])
    if max(ypos)<0
        ylim([min(ypos) 0])
    else
        ylim([min(ypos) max(ypos)])
    end
    pause(0.01)
end


function [dxdt]=pendulo_resorte_nl(t,X)
    global m l k g
    %X(1)=r X(2)=rp X(3)=theta X(4)=thetap
    x1p=X(2);
    x3p=X(4);
    x2p=g*cos(X(3))-(k/m)*(X(1)-l)+ X(1)*X(4)^2;
    x4p=-(2*X(2)*X(4)+g*sin(X(3)))/X(1);
    dxdt=[x1p;x2p;x3p;x4p];

end