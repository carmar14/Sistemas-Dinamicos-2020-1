%-----------Animacion de llenado de tanque---------

clear
close all
clc

%Parametros del tanque
R1=10;
R2=28;
C1=40;
C2=60;

sis=tf(R2,[R1*R2*C1*C2 C1*R1+C1*R2+R2*C2 1]); %H1(s)/Qi(s)
[p z]=pzmap(sis);

tao=-1/real(p(1))-1/real(p(2));
Test=6*tao;
t=0:Test/100:Test;
% [y t]=step(sis);
y=step(sis,t);
sis2=tf(R2*[R1*C1 1],[R1*R2*C1*C2 C1*R1+C1*R2+R2*C2 1]); %H2(s)/Qi(s)
ys=step(sis2,t);

A=[-1/(R1*C1) 1/(R1*C1)
    1/(R1*C2) -1/C2*(1/R2+1/R1)];
B=[0 1/C2]';
C=[1 0;
   0 1];
sis3=ss(A,B,C,[]);

yss=step(sis3,t);


plot(t,y,'k',t,yss(:,1),'r')
hold on
% step(sis)
ylabel('h1(m)');
xlabel('Tiempo (s)');
title('Nivel de altura del líquido almacenado en el tanque 1')

figure
plot(t,ys,'k',t,yss(:,2),'r')
% hold on
% step(sis2)
ylabel('h2(m)');
xlabel('Tiempo (s)');
title('Nivel de altura del líquido almacenado en el tanque 2')



%Tanque animación
lt=10; %largo de la tuberia de union
at=2; %ancho de la tuberia de union
figure
l=length(t);

%Creación del tanque1
x1=[0 0];
y1=[0 y(end)+1];
x2=[0 C1];
y2=[0 0];
x3=[C1 C1];
y3=[0 y(end)+1];
%Creación del tanque2
x12=[C1+lt C1+lt];
y12=[0 ys(end)+1];
x22=[C1+lt C1+lt+C2];
y22=[0 0];
x32=[C1+lt+C2 C1+lt+C2];
y32=[0 ys(end)+1];



v=2;
if v==1
    x=[0 C1 C1 0]; %para el fill
    line(x1,y1,'Color','black','LineWidth',2)
    hold on
    line(x2,y2,'Color','black','LineWidth',2)
    line(x3,y3,'Color','black','LineWidth',2)
    
    x20=[C1+lt C1+lt+C2 C1+lt+C2 C1+lt]; %para el fill
    line(x12,y12,'Color','black','LineWidth',2)
    line(x22,y22,'Color','black','LineWidth',2)
    line(x32,y32,'Color','black','LineWidth',2)
else
    x=linspace(0,C1,l); %para el area
    xs=linspace(C1+lt,C1+lt+C2,l);
end

%Tuberia de union entre los dos tanques
xu=[C1 C1+lt C1+lt C1];
yu=[0 0 at at];
fill(xu,yu,'k');
%Llenado de tanque
for i=1:l
    if v==1
        nively=[0 0 y(i) y(i)]; %para el fill
        fill(x,nively,'b')
        hold on
        ylim([0 y(end)+1.5])
        
        nively2=[0 0 ys(i) ys(i)];
        fill(x20,nively2,'b')
        
        pause(0.1)
    else
        nively=y(i)*ones(1,l); %Para el area
        area(x,nively,'FaceColor','b','FaceAlpha',.6,'EdgeAlpha',0)
        hold on
        %Para el area
        line(x1,y1,'Color','black','LineWidth',2)
        line(x2,y2,'Color','black','LineWidth',2)
        line(x3,y3,'Color','black','LineWidth',2)
        %         hold off
        %Para el area
        
        nively2=ys(i)*ones(1,l); %Para el area
        area(xs,nively2,'FaceColor','b','FaceAlpha',.6,'EdgeAlpha',0)
        
        %Para el area
        line(x12,y12,'Color','black','LineWidth',2)
        line(x22,y22,'Color','black','LineWidth',2)
        line(x32,y32,'Color','black','LineWidth',2)
        
        %Tuberia de union entre los dos tanques
        xu=[C1 C1+lt C1+lt C1];
        yu=[0 0 at at];
        fill(xu,yu,'k');
        
        hold off
        %Para el area
        
        ylim([0 y(end)+1.5])
        pause(0.1)
    end
    
end