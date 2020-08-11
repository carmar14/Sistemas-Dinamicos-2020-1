clear
close all
clc

%Parametros G2 (Sistema de 5 orden)
e1=0.6;
wn1=5;
e2=0.2;
wn2=1000; 
tao=0.001;
k=2;
h=tf(k*wn1^2,[1 2*e1*wn1 wn1^2]); %polos dominantes
h2=h*tf(wn2^2,[1 2*e2*wn2 wn2^2])*tf(1,[tao 1]);
% step(5*h,'--b')
% hold on
% step(5*h2,'.r')
he=tf(2.828e8,[1 246.2 1.81e4 1.152e6 6.867e6 2.828e7])
he=tf(2*49.8^2,[1 61.45 49.8^2])*tf(1,[1/10 1])*tf(120^2,[1 12 120^2]);
step(5*h)
grid on
hold on
step(5*he)

figure
pzmap(h2)
hold on
pzmap(he)


%Parametros G4 (Sistema de 5 orden)
e1=0.6;
wn1=5;
e2=0.2;
wn2=1000; 
tao=1000;
k=1/2;
h=tf(-k,[tao 1]); %Polos dominantes
h2=tf(wn1^2,[1 2*e1*wn1 wn1^2])*tf(wn2^2,[1 2*e2*wn2 wn2^2])*h;
figure
% step(-4*h,'--b')
% hold on
% step(-4*h2,'.r')
step(-4*h)
grid on

figure
pzmap(h2)


%Punto 4 (Diagram de Bode)
%G2 %G4
h3=2*tf([1 5],5)*tf(20,[1 20])*tf(50,[1 50])*tf([1 150],150);
figure
bode(h3)
grid on
h4=2*tf([1 20],20)*tf(5,[1 5])*tf(100,[1 100])*tf([1 50],50);
figure
bode(h4)
grid on
h5=2*tf([1 10],10)*tf(5,[1 5])*tf([1 20],20)*tf(50,[1 50]);
figure
bode(h5)
grid on

figure
step(h3,h4,h5)

close all

%Parametros del punto 1
Ka=50;
R=10;
Kb=0.0706;
Km=10;
J=0.006;
C=10;

K1=10;
K2=3;
R=0.1;
L=0.2;
Ks=1.5;
Ka=1;
ta=0.4;
