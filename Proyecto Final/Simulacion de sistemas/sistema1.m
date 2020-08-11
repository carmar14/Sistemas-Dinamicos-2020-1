clc
clear
close all
global tr
tr=1;
Xini=[0 0 0];
t=0:1e-3:1;
[t,y]=ode45(@sistema,t,Xini);

figure
[m n]=size(y);
for i=1:n
    subplot(n,1,i)

    plot(t,y(:,i))

end

function xp=sistema(t,X)
global tr
%Parametros
ks=1;
ki=0.68;
kb=0.68;
A=200;
Ra=5;
La=0.1;
Jm=0.00136;
Jc=0.136;
fc=0.136; %100*0.136;
n1=1;
n2=10;

v1=tr*ks;
%X(1)=i; X(2)=tc X(3)=tcp
v2=X(2)*ks;
% tm=X(2)*n2/n1;
tmp=X(3)*n2/n1;
e=v1-v2;
ea=A*e;
x1p=(ea-kb*tmp-Ra*X(1))/La;
x2p=X(3);
x3p=(n2*ki*X(1)/n1-fc*X(3))/(Jc+Jm*(n2/n1)^2);
xp=[x1p x2p x3p]';
end