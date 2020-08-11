clear
close all
clc

R=10;
L=1e-3;
m1=10;
m2=5;
b1=10;
b2=30;
k1=100;
k2=300;
km=4;
ke=0.5;


num=km*k1;
den=[L*m1*m2 L*b1*m2+L*b2*m1+R*m1*m2 L*k1*m1+L*k1*m2+L*b1*b2+R*b1*m2+R*b2*m1+L*k2*m1+ke*km*m2 L*k1*b1+L*b2*k1+R*k1*m1+R*k1*m2+R*b1*b2+L*b1*k2+R*k2*m1+b2*ke*km R*b1*k1+R*b2*k1+L*k1*k2+k1*ke*km+R*b1*k2+k2*ke*km R*k1*k2];
h=tf(num,den);

A=[-R/L 0 -ke/L 0 0;
    0 0 1 0 0;
    km/m1 -k1/m1 -b1/m1 k1/m1 0;
    0 0 0 0 1;
    0 k1/m2 0 -(k1+k2)/m2 -b2/m2];
B=[1/L 0 0 0 0]';
C=[0 0 0 1 0];
D=[];
sis=ss(A,B,C,D); %salida x2
step(h)
hold on 
step(sis)

%salida x1
num=[m2*km km*b2 k1*km+km*k2];
h=tf(num,den);
C=[0 1 0 0 0];
D=[];
sis=ss(A,B,C,D); %salida x1
figure
step(h)
hold on 
step(sis)
  