clear 
close all
clc

%Parametros
M1=10;
M2=30;
K1=100;
k1=100;
k2=400;
k3=150;
B1=40;
B3=10;
B2=20;

%TF
h=tf([B3 k2],[M1*M2 (M2*B1+M1*(B2+B3)+M2*B3) (B1*(B2+B3)+M1*(k2+k3)+M2*k2+B3*B2) (B1*(k2+k3)+k2*B2+k3*B3) k2*k3]);
den1=conv([M1 B1 K1],[M2 B2+B3 k2+k3]);
den2=conv([B3 k2 0],[M2 B2 k3]);
den=den1+den2;
h2=tf([B3 k2],den);
%VE
A=[0 1 0 0;
   -(k1+k2)/M1 -(B1+B3)/M1 k2/M1 B3/M1;
   0 0 0 1;
   k2/M2 B3/M2 -(k3+k2)/M2 -(B2+B3)/M2];
B=[0; 1/M1;0 ;0];
C=[0 0 1 0];
D=[];
sis=ss(A,B,C,D);


step(h)
hold on
step(sis)
figure
pzmap(sis)
hold on 
pzmap(h2)


figure
step(sis)
hold on
step(h2)



