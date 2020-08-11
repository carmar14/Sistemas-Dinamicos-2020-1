clear
clc
close all

den=conv([0.5 1],[1/50^2 0.6/50 1]);
den=conv([1 0],den);
num=conv(5,[0.1 1]);

h=tf(num,den);%*tf([1 0],1);

[p z]=pzmap(h);


num=5*2*50^2/10*[1 10];
den=conv([1 2 0],[1 30 2500]);
% num=5;
% den=[1 0];
h2=tf(num,den);

step(h)
hold on 
step(h2)

figure
bode(h)
hold on
bode(h2)
grid on

[p2 z2]=pzmap(h2);



