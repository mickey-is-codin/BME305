clc;
clear all;

t = 0:.01:2;

R = 50000;
C = 0.318e-6;

tau = R * C;

Vin = sin(2*pi*t) + sin(100*2*pi*t) + sin(120*2*pi*t);
Vin_comps = [sin(2*pi*t), sin(100*2*pi*t), sin(120*2*pi*t)];

w = [.02*pi, 1*2*pi, 1.2*2*pi];

Vo = (sin(2*pi*t))*((w(1)*R*C)/(sqrt(1 + (w(1)*R*C).^2))) + (sin(100*2*pi*t))*((w(2)*R*C)/(sqrt(1 + (w(2)*R*C).^2))) + (sin(120*2*pi*t))*((w(3)*R*C)/(sqrt(1 + (w(3)*R*C).^2)));

figure(1)
hold on
plot(t,Vin, 'b');
plot(t,Vo, 'r');
title('Input voltage form compared to output voltage across resistor');
legend('Input Voltage', 'Output Voltage');
xlabel('Time(s)');
ylabel('Voltage(V)');
hold off

disp(tau);
