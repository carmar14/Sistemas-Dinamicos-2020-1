clc
clear
close all
global ea
ea=1; %2
Xini=[0 0 0 0];
t=0:1e-3:10;
[t,y]=ode45(@sistema,t,Xini);

figure
[m n]=size(y);
for i=1:n
    subplot(n,1,i)

    plot(t,y(:,i))

end

function xp=sistema(t,X)
global ea
%Parametros

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


%X(1)=tm X(2)=tmp X(3)=x X(4)=xp
x1p=X(2);
x2p=(ki/Ra*(ea-kb*X(2))-bm*X(2)-bg*(n1/n2)*(X(2)*n1/n2-X(4)/R))/Jm;
x3p=X(4);
x4p=(bg*(X(2)*n1/n2-X(4)/R))/(M*R);
xp=[x1p x2p x3p x4p]';
end