clc
clear
close all

%Punto 1
k1=1;
k2=1;
b=1;
m=1;
B=1;
R=1;
J=1;
%matrices
A=[0 1 0 0;
  -(k1+k2)/m -b/m k2*R/m 0;
  0 0 0 1;
  k2*R/J 0 -k2*R^2/J -B/J];
Bs=[0 0 0 1/J]';
C=[1 0 0 0; 0 0 1 0]; %Grupo 2
D=[];
sisG2=ss(A,Bs,C,D);
C=[1 0 0 0; 0 0 R 0]; %Grupo 4
sisG4=ss(A,Bs,C,D);

figure
step(sisG2)
figure
step(sisG4)

%Punto2 G2
ks=1;
ki=0.68;
kb=0.68;
A=200;
Ra=5;
La=0.1;
Jm=0.00136;
Jc=0.136;
fc=0.136;
n1=1;
n2=10;

num=ki*ks*A*(n1/n2);
den=[(Jm*La+La*Jc*(n1/n2)^2) (La*fc*(n1/n2)^2+((n1/n2)^2*Jc+Jm)*Ra) (Ra*fc*(n1/n2)^2+ki*kb) ki*ks*A*(n1/n2)];
figure
step(num,den)

%Punto2 G4

ki=1;
kb=1;
Ra=1;
Jm=1;
M=1;
R=2;
bg=4;
bm=1;
n2=10;
n1=1;

num=ki*bg*R*(n1/n2);
den=[(Jm*M*R^2*Ra) (Ra*(M*R^2*bm+Jm*bg+M*R^2*bg*(n1/n2)^2)+ki*kb*M*R^2) (Ra*bm*bg+kb*bg*ki) 0];
h=tf(num,den);
figure
step(h)
xlim([0 10])
