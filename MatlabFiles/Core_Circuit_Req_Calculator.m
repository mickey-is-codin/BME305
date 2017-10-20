clc;
clear all;

stages = 3; %Number of stages = number of Rmem's

%Right end of Core Conductor Circuit

Rint = 10;
Rmem = 20;
Rext = 30;

%Req_3stages = 1/() + Rext + Rint

Req = [];

Req(1) = Rint + Rmem + Rext;

for i = 2:stages
    R_prev = 1/((1/Rmem) + (1/(Req(i-1))));
    Req(i) = Rext + Rint + R_prev;
    %Req(i) = 1/(1/(Rint + Rmem + Rext) + 1/(Rmem)) + Rint + Rext;
    endo

Req(1) = Rint + Rmem + Rext;


disp(Req);