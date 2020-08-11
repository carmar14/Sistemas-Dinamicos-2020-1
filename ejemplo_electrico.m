clc
clear
close all

%%

%Parametros
R=1e3;
L=100e-3;
C=1e-6;

h=tf(R,[R*L*C L R]); %Creo funcion transferencia

pzmap(h) %Diagrama de polos y ceros

[p z]=pzmap(h); %Calcula y devuelve polos y ceros

%Variables de estado
A=[0 -1/L; 1/C -1/(R*C)];
B=[1/L; 0];
C1=[0 1];
D=0;

sis=ss(A,B,C1,D); %Representacion en VE
figure
pzmap(sis) %Diagrama de polos y ceros
%Respuesta en el tiempo
figure
step(h,'-o');
hold on
step(sis,'-r');
legend('h','sis')






