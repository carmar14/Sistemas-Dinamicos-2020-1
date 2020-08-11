% Tarea 2
clc; clear all; close all;
J1 = 3; %kg*m^2
J2 = 3; %kg*m^2
J3 = 3; %kg*m^2
M = 1; %kg
K1 = 3; %N*m/rad
K2 = 3; %N/m
D3 = 1; %N*m*s/rad
fv = 20; %N*s/m 
r = 0.02; %m

% J1 = 200; %kg*m^2
% J2 = 10; %kg*m^2
% J3 = 100; %kg*m^2
% M = 20; %kg
% K1 = 7000; %N*m/rad
% K2 = 20; %N/m
% D3 = 400; %N*m*s/rad
% fv = 230; %N*s/m 
% r = 0.02; %m


%V.E

A = [0 1 0 0 0 0;
    -K1/J1 0 K1/J1 0 0 0;
     0 0 0 1 0 0;
     K1/(J2+M*r^2) 0 -(K1+K2*r^2)/(J2+M*r^2) -(D3+fv*r^2)/(J2+M*r^2) 0 D3/(J2+M*r^2);
     0 0 0 0 0 1;
     0 0 0 D3/J3 0 -D3/J3];

B = [0 0;
    1/J1 0;
    0 0;
    0 M*r/(J2+M*r^2);
    0 0;
    0 0];

C = [K1/(J2+M*r^2) 0 -(K1+K2*r^2)/(J2+M*r^2) -(D3+fv*r^2)/(J2+M*r^2) 0 D3/(J2+M*r^2)]*r;

D = [0 M*r^2/(J2+M*r^2)];

sis = ss(A,B,C,D);
% sis2=ss(A,B,C,D);
opt = stepDataOptions('StepAmplitude',30,'StepAmplitude',9.8);
step(sis,opt)
figure
step(sis)
figure
[y t]=step(sis,opt);
plot(t,y(:,:,1)+y(:,:,2))

figure 
pzmap(sis)
[p z]=pzmap(sis);
 