clc;
clear all;

t = [820 820 820];
e = [900 800 760];

p_e = abs(((t - e)./t) * 100);

disp(p_e)

a = mean(p_e)

disp(a)