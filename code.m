clc
clear 
close all

%Sistema de primer orden
k=4;
tao=5;
h=tf(k,[tao 1]);



%Polo adicional
taop=1/2;
h2=tf(1,[taop 1]);
figure
pzmap(h)

hold on
pzmap(h2)
legend('polo Sistema de primer orden','polo adicional')

%Sistema total
ht=h*h2;

figure
step(h,'b')
hold on
step(ht,'k*')
legend('Sistema de primer orden','Sistema total')

close all

%Sistema de segundo orden
k=2;
e=0.4;
wn=4;
h=tf(k*wn^2,[1 2*e*wn wn^2]);
[p z] = pzmap(h)




%Polo adicional polo real
taop=1/4;
h2=tf(1,[taop 1]);


figure
pzmap(h)

hold on
pzmap(h2)
legend('polo Sistema de segundo orden','polo adicional')



%Sistema total
ht=h*h2;


figure
step(h,'b')
hold on
step(ht,'k*')
legend('Sistema de segundo orden','Sistema total')




