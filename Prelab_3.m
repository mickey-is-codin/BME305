clc;
clear all;

Ra = 220;
Rb = 100;
Rc = 1500;
Rd = 1000;
Rl = 330;

syms V1 V2
eqn1 = (V1 - 0.75)/220 == V1/220 + (V1 - V2)/1500 + (x - y)/1000;
eqn2 = (V1 - V2)/1000 + (V1 - V2)/1500 == V2/330;

[A,B] = equationsToMatrix([eqn1, eqn2], [V1, V2])

X = linsolve(A,B);

%Node 1 Eq's

%Node 2 Eq's