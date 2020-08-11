clear 
close all
clc
%Simulacion ejercicio de engranajes

%Variables de estado del Grupo 4
%Parametros del sistema
J1=2;J2=4;K1=5;K2=4;B1=10;B2=34;
r1=0.5;r2=0.1;

%Marices A,B,C,D
A=[0 1; -(K2+K1*(r2/r1)^2)/(J2+J1*(r2/r1)^2) -(B2+B1*(r2/r1)^2)/(J2+J1*(r2/r1)^2)];
B=[0 0; 1/(J2+J1*(r2/r1)^2) (r2/r1)/(J2+J1*(r2/r1)^2)];
C=[1 0];
D=[];

sis1=ss(A,B,C,D);  %x1=theta2,x2=theta2p,
step(sis1);
[y t]=step(sis1);

%Variables de estado del Grupo 2
%Marices A,B,C,D

A=[0 1; -(K1+K2*(r1/r2)^2)/(J1+J2*(r1/r2)^2) -(B1+B2*(r1/r2)^2)/(J1+J2*(r1/r2)^2)];
B=[0 0; 1/(J1+J2*(r1/r2)^2) (r1/r2)/(J1+J2*(r1/r2)^2)];
C=[r1/r2 0];
D=[];

sis2=ss(A,B,C,D);  %x1=theta1,x2=theta1p,
figure
step(sis2);
[y2 t2]=step(sis2);

%Comparación entre las dos representaciones
%Recordar que aunque las variables de estado eran distintas
%la salida era la misma : la posicion angular 2

yt=y(:,:,1)+y(:,:,2);
yt2=y2(:,:,1)+y2(:,:,2);
figure
plot(t,yt)
title('Respuesta al escalón unitario')
xlabel('Tiempo(s)')
ylabel('\theta_2(rad)')

hold on
plot(t2,yt2,'.')
title('Respuesta al escalón unitario')
xlabel('Tiempo(s)')
ylabel('\theta_2(rad)')

legend('Sistema G4','Sistema G2')
