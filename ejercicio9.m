clear 
close all
clc

%Parametros
a=1;
Ra=0.1;
Ka=1;
K=1;
B1=1;
B2=10;
Jm=10;
Jt=0.1;
M=1;
r=0.001;

A=[0 1; 0 -((a*Ka*K+a^2)/Ra+B1+B2*r^2)/(Jm+Jt+M*r^2)];
B=[0 0; (a*Ka/Ra)/(Jm+Jt+M*r^2) -r/(Jm+Jt+M*r^2)];
C=[0 r];
D=[];

sis=ss(A,B,C,D);
figure
pzmap(sis)
figure
[y t]=step(sis);
plot(t,y(:,1,1)+y(:,1,2))
ylabel('dx/dt(m/s)')
xlabel('Tiempo(s)')
title('Respuesta al escalon unitario')
