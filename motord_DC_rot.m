clear 
clc
close all

%Parametros
R=10;
L=0.0001;
% L=1e-3; %Comportamiento similar debido a que L<<R
Kb=5;
Kp=5;
J=0.01;
b=0.1;

h=tf(Kp,[J*L R*J+b*L Kp*Kb+R*b]);
step(h)


hsim=tf(Kp,[R*J Kp*Kb+R*b]);
hold on 
step(hsim)
title('Respuesta al escalón unitario')
xlabel('Tiempo(s)')
ylabel('d\theta/dt (rad/s)')
legend('Sistema original','Sistema simpl.')

figure
pzmap(h)
hold on
pzmap(hsim)
legend('Sistema original','Sistema simpl.')


%VE

A=[-R/L 0 -Kb/L;
    0 0 1;
    Kp/J 0 -b/J];
B=[1/L; 0;0];
C=[0 1 0; 0 0 1; 1 0 0];
D=[];

sis=ss(A,B,C,D);
figure
step(sis)