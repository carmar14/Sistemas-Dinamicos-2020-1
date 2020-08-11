clear 
close all
clc
%Analisis de estabilidad en frecuencia
ft=8*tf([1 70],1)*tf(1,[1 0])*tf(1,[1 4])*tf(1,[1 25]);
ft2=5.6*tf([1 70],70)*tf(1,[1 0])*tf(4,[1 4])*tf(25,[1 25]);
figure
step(ft);
hold on
step(ft2);
[mg,mf,wmg,wmf] = margin (ft.numerator,ft.denominator);
figure
margin(ft.numerator,ft.denominator);
grid on
figure
step(feedback(ft,1))

%Analisis de estabilidad bucle abierto k*1/(s(s+1)^2)
figure
k=[0.1 2 10];
for i=1:length(k)
    subplot(1,3,i)
    sys=k(i)*tf(1,[1 0])*tf(1,[1 2 1]);
    margin(sys.numerator,sys.denominator);
    hold on
    grid on
    if i==1
        legend('k=0.1')
    elseif i==2
        legend('k=2')
    else
        legend('k=10')
    end
end

figure
for i=1:length(k)
    subplot(1,3,i)
    sys=k(i)*tf(1,[1 0])*tf(1,[1 2 1]);
    step(feedback(sys,1));
    grid on
    if i==1
        legend('k=0.1')
    elseif i==2
        legend('k=2')
    else
        legend('k=10')
    end
end