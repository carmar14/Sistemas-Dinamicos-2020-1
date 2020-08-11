clear
clc
close all

%Parametros
b=100000;  % b pequeño oscilaciones
K2=300;
R=0.01;
K1=34;
J=12;
M=10;

%Representacion en VE
A=[0 1; -(K2+K1/R^2)/(M+J/R^2) -b/(M+J/R^2)];
B=[0 1/(M+J/R^2)]';
C=[1 0; 1/R 0];
D=[];

sis=ss(A,B,C,D);
%Respuesta al escalon unitario
step(sis)
figure
pzmap(sis)

[y t]=step(sis);
figure
subplot(2,1,1)
plot(t,y(:,1))
title('Respuesta al escalon unitario')
ylabel('x(m)')
xlabel('Tiempo (s) ')
subplot(2,1,2)
plot(t,y(:,2))
title('Respuesta al escalon unitario')
ylabel('\theta (rad)')
xlabel('Tiempo (s)')
% title('Respuesta al escalon unitario')
% ylabel('\theta (rad)')


