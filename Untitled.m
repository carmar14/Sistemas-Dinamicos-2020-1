clear
close all
clc

e=0.7;
wn=10;
k=1;
h2=tf([1 1],1);
H=tf(k*wn^2,[1 2*e*wn wn^2])*h2*h2;
h=tf(k*wn^2,[1 2*e*wn wn^2]);
pzmap(H)

figure

step(H)
hold on 
step(h)