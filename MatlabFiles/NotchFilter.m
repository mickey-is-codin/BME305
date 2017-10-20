clc;
clear all;

R = 10000;
C = 1.5e-6;
w = .1;
t = 0:100;

Vin = .02*sin(w.*t);

plot(t,Vin);

Z1 = 2*R;
Z2 = 2*R;

Z3 = 1/(1i*w*2*C);

Z4 = R;

Z5 = 1/(1i*w*C);

Z6 = 1/(1i*w*C);

lowPassZeq = 1/((1/Z1) + (1/Z2) + (1/Z3));%Z1 || Z2 || Z3

highPassZeq = 1/((1/Z4) + (1/Z5) + (1/Z6));%Z4 || Z5 || Z6

I1 = Vin * highPassZeq
I2 = Vin * lowPassZeq

