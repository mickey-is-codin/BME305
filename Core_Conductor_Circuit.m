clc;
clear all;

l = 1; %cm
ai = 10 * 10^(-4); %cm
ao = 20 * 10^(-4); %cm
d = 2 * 10^(-4); %cm
Aint = pi * ai^2;
Aext = pi * (ao^2 - (ai)^2);
%Vap = 0.150; %V
%Vap = 9;
Vap = 5;

%Theoretical (Real World)
% rho_int = 30; %ohm*cm
% rho_ext = 50; %ohm*cm
% rho_mem = 1000; %ohm*cm^2
% 
% Rint = rho_int / l; %ohms
% Rext = rho_ext / l; %ohms
% Rmem = rho_mem / ((2*pi)*(ai)); %ohms

%Theoretical (Lab)
Rint = 220;
Rext = 100;
Rmem = 560;

%Theoretical (Real World Adjusted for us to use)
rho_int = 30; %ohm*cm
rho_ext = 50; %ohm*cm
rho_mem = 10000; %ohm*cm^2

% Rint = rho_int * l / Aint;
% Rext = rho_ext * l / Aext;
% Rmem = rho_mem / ((2*pi)*(ai+d)); %ohms
Req_tot = 1/(1/(1/(1/(Rint + Rmem + Rext) + 1/Rmem) + Rint + Rext) + 1/Rmem) + Rint + Rext;


%Req Calculator
% stages = 3;

% R_prev = Rext + Rint + Rmem;

%Req For Loop
% for (i = 1:stages)
%     R_prev = 1/((1/Rmem) + (1/R_prev));
%     Req(i) = Rint + Rext + R_prev;
% end

% disp(Req(i));


%Node 1 Currents
i1 = Vap / Req_tot;
Req1 = (1/(((1/(Rint + Rmem + Rext))) + (1/Rmem))) + Rint + Rext;
i2 = i1 * Req1/(Rmem + Req1);
i3 = i1 - i2;

%Node 2 Currents
Req2 = Rint + Rmem + Rext;
i4 = i3 * Req2/(Req2 + Rmem);
i5 = i3 - i4;

%Other Currents
i6 = i4 + i5;
i7 = i2 + i6;

%Voltages
Vrint1 = i1 * Rint;
Vrint2 = i3 * Rint;
Vrint3 = i5 * Rint;

Vrext1 = i7 * Rext;
Vrext2 = i6 * Rext;
Vrext3 = i5 * Rext;

Vrmem1 = i3 * Rmem;
Vrmem2 = i4 * Rmem;
Vrmem3 = i5 * Rmem;

VintGround1 = 0 + Vrext1 + Vrmem1;
VintGround2 = 0 + Vrext1 + Vrext2;
VintGround3 = 0;

%Results

fprintf('Currents in nA: \n\nNode 1:\ni1 = %.3f\ni2 = %.3f\ni3 = %.3f\n\nNode 2:\ni4 = %.3f\ni5 = %.3f\n\nOther Nodes:\ni6 = %.3f\ni7 = %.3f\n\n', i1 * 1000, i2 * 1000, i3 * 1000, i4 * 1000, i5 * 1000, i6 * 1000, i7 * 1000);
fprintf('Voltages in mV: \nVoltage across Rint1 = %.3f\nVoltage across Rint2 = %.3f\nVoltage across Rint3 = %.3f\n\nVoltage across Rext1 = %.3f\nVoltage across Rext2 = %.3f\nVoltage across Rext3 = %.3f\n\nVoltage across Rmem1 = %.3f\nVoltage across Rmem2 = %.3f\nVoltage across Rmem3 = %.3f\n', Vrint1, Vrint2, Vrint3, Vrext1, Vrext2, Vrext3, Vrmem1, Vrmem2, Vrmem3);
fprintf('Voltages needed for lab:\nVintGround1: %.3f\nVintGround2: %.3f\nVintGround3: %.3f\n', VintGround1, VintGround2, VintGround3);
