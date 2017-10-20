clc;
clear all;

V_in = 5;

R1 = 0.1;
R2 = 0;
Rload = 10;

%KCL @ Node 1
Req_i1 = 1/((1/Rload) + (1/R2)) + R1
i1 = V_in/Req_i1
i2 = i1 * (R2)/(R2 + Rload)
i3 = i1 * (Rload)/(R2 + Rload)

Il = i2
Vl = Rload * Il

%disp(Il);
%disp(Vl);