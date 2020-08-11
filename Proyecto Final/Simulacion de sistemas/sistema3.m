clc
clear
close all
global Tr Tc
Tr=30;
Tc=20;
Xini=[0 18 0 0];
t=0:1000;
[t,y]=ode45(@sistema,t,Xini);


[m n]=size(y);
for i=1:n
    subplot(n,1,i)

    plot(t,y(:,i))

end

function xp=sistema(t,X)
global Tr Tc
%Parametros
R=0.1;
L=0.1e-3;
K2=1;
K1=0.0100;
Ks=0.5;
kb=0.5;
K3=0.4;
Kc=0.5;
Ct=100; %1000
Rt=1;%10
M=0.5; %0.5
k=10;
b=300;

%X(1)=i X(2)=T  X(3)=x X(4)=xp
e1=(Tr-X(2))*K1*K2;
F=Ks*X(1);
qin=K3*X(3);
q=qin*Kc;

x1p=(e1-R*X(1)-kb*X(4))/L;
x2p=((Tc-X(2))/Rt+q)/Ct;
x3p=X(4);
x4p=(F-b*X(4)-k*X(3))/M;

xp=[x1p x2p x3p x4p]';
end