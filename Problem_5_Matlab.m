% Tarea 2
clc; clear all; close all;

% Parameters:
J1 = 200; %kg*m^2
J2 = 10; %kg*m^2
J3 = 100; %kg*m^2
M = 20; %kg
K1 = 700; %N*m/rad  si disminuye no hay tanta oscilacion
K2 = 20; %N/m
D3 = 400; %N*m*s/rad
fv = 2300000; %N*s/m si aumento no hay tanta oscilacion y se demora menos en estabilizar
r = 0.02; %m



% State Variables:
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

% B = [0 0;
%     1/J1 0;
%     0 0;
%     0 0;
%     0 0;
%     0 0];

C = [K1/(J2+M*r^2) 0 -(K1+K2*r^2)/(J2+M*r^2) -(D3+fv*r^2)/(J2+M*r^2) 0 D3/(J2+M*r^2)]*r;

D = [0 M*r^2/(J2+M*r^2)];

% D = [0 0];

sis = ss(A,B,C,D);
figure(1)
step(sis)
title('Unit step response')

opt = stepDataOptions('StepAmplitude',30,'StepAmplitude',9.8);
Tf=1/0.0001;

figure(2)
step(sis,opt)
title('Step response, with T = 30 and g = 9.8')

figure(3)
[y t x]=step(sis,opt);
Y = y(:,:,1)+y(:,:,2);
plot(t,Y)
title('Resulting output')
ylabel('\it{\bf{\"X(t)}}','Interpreter','latex')
xlabel('Time(seconds)')
grid on
figure(4) 
pzmap(sis)
[p z]=pzmap(sis);
p
z

% Transfer Function: 
[n1 d1] = ss2tf(A,B,C,D,1);
h1 = tf(n1,d1); % transfer function with respect to the first input.
[n2 d2] = ss2tf(A,B,C,D,2);
h2 = tf(n2,d2); % transfer function with respect to the second input.
h = h1+h2; % resulting transfer function.
% figure
% step(h)
% h3 = tf(1e9,[1 1e19]);
% ht = h*h3;
% figure 
% step(ht)

ne = poly(z);
de = poly(p);

ymax = max(y(:,:,1));
yss = y(end,:,1);
SO = (ymax-yss)/yss;

Ts = 0.4;

a = (log(SO))^2;

E = sqrt(a/(pi^2+a));

wn = 4/(E*Ts);

k = yss/wn^2;

%F.C
% num = k*wn^2;
num = k*wn^2;
den = [1 2*E*wn wn^2];

H = tf(num,den);
figure(5)
step(H)
figure(6)
pzmap(H)

%% 
pd = [-0.000149420182224335 0.00507768042856228i];
E = pd;


den2=conv([0.0001 0.0051i],[0.0001 -0.0051i]);
hnew=tf(num,den2);
hold on
pzmap(hnew)
figure
step(hnew);
title('dsadsa')

%% Transfer Function Second Order: (Underdamped System)
% clc;
% k = 6.4667e-05;
% E = 0.2; % sqrt((ln(1.16e-3))/(100*(pi^2+ln(1.16e-3)/100)))
% wn = 1;

% n = k*wn^2;
% d = [1 2*E*wn wn^2];

% n = [1 4];
% d = [1 2e-4 2.602e-5];

% 13.2456414689155

% n = [1.94001e-3 6.4667e-05];
% d = [1 30.7313 327.4094];

n = 1.94001e-3*[1 4];
d = [1 30.7313 327.4094];

% n = [1 4];
% d = [1 0 0];

% wn = sqrt(327.4094);
% E = 30.7313/(2*wn);
% k = 1/wn^2;
% n = k*wn^2;
% d = [1 2*E*wn wn^2];

h = tf(n,d);
figure
step(h*9.8)
title('Underdamped System')
grid on

% figure
% pzmap(h)

figure
plot(t,y(:,:,1))
title('Prueba1')

% close all
figure

step(sis,40000)
title('Prueba VF')
% step(sis)
figure

pzmap(sis)

