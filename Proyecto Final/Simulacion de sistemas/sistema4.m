clc
clear
close all
global r 
r=0.30;

Xini=[0 0 0];
t=0:1e-3:15;
[t,y]=ode45(@sistema,t,Xini);


[m n]=size(y);
for i=1:n
    subplot(n,1,i)

    plot(t,y(:,i))

end

function xp=sistema(t,X)
global r
%Parametros
Ra=1000;
La=1e-3;
Ks=0.5;
Ka=10;
kb=0.25;
ki=0.25;
M=0.2; %0.5
k=1;
b=3;

%X(1)=i X(2)=x  X(3)=xp
e=Ka*(r-X(2))*Ks;
F=ki*X(1);
fem=kb*X(3);
x1p=(e-Ra*X(1)-fem)/La;
x2p=X(3);
x3p=(F-b*X(3)-k*X(2))/M;
xp=[x1p x2p x3p]';
end