clc;
clear all;

%Theoretical (Real World) All values = ohms
% Rn = 50;
% Rra = 225;
% Rla = Rra;
% Rt = 75;
% Rll = 225;
% Rrl = Rll;

%Theoretical (Lab) All values = ohms
Rn = 56;
Rra = 220;
Rla = Rra;
Rt = 82;
Rll = 150;
Rrl = Rll;

Vs = 1.15; %V
V2 = 3; %V

%Configuration A (Neck, Left Arm, and Left Leg Floating)
Ira_A = Vs/(Rra + Rt + Rrl);
It_A = Ira_A;
Irl_A = It_A;
In_A = 0;
Ila_A = 0;
Ill_A = 0;

Vra_A = Ira_A * Rra;
Vt_A = It_A * Rt;
Vrl_A = Irl_A * Rrl;
Vn_A = In_A * Rn;
Vla_A = Ila_A * Rla;
Vll_A = Ill_A * Rll;

%Configuration B (Neck, Left Arm Floating)
Req_B = Rra + Rt + (Rll * Rrl)/(Rll + Rrl);

Ira_B = Vs / (Req_B);
It_B = Ira_B;
Ill_B = It_B / 2;
Irl_B = Ill_B;
In_B = 0;
Ila_B = 0;


Vra_B = Ira_B * Rra;
Vt_B = It_B * Rt;
Vrl_B = Irl_B * Rrl;
Vn_B = In_B * Rn;
Vla_B = Ila_B * Rla;
Vll_B = Ill_B * Rll;

%Configuration C (Neck Floating)
Ira_C = Ira_B;
Ila_C = V2 / Req_B;
It_C = Ira_C + Ila_C;
Ill_C = It_C / 2;
Irl_C = Ill_C;
In_C = 0;

Vra_C = Ira_C * Rra;
Vt_C = It_C * Rt;
Vrl_C = Irl_C * Rrl;
Vn_C = In_C * Rn;
Vla_C = Ila_C * Rla;
Vll_C = Ill_C * Rll;

Sum = Ira_C + Ila_C
new = Sum * 82

fprintf('Configuration A values:\n\n Currents in mA: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Ira_A  , Ila_A  , It_A  , Irl_A  , Ill_A  ); 
fprintf('\n\n Voltages in mV: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Vra_A  , Vla_A  , Vt_A  , Vrl_A  , Vll_A  ); 

fprintf('Configuration B values:\n\n Currents in mA: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Ira_B  , Ila_B  , It_B  , Irl_B  , Ill_B  );
fprintf('\n\n Voltages in mV: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Vra_B  , Vla_B  , Vt_B  , Vrl_B  , Vll_B  );

fprintf('Configuration C values:\n\n Currents in mA: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Ira_C  , Ila_C  , It_C  , Irl_C  , Ill_C  );
fprintf('\n\n Voltages in mV: \n Right Arm: %.3f\n Left Arm: %.3f\n Torso: %.3f\n Right Leg: %.3f\n Left Leg: %.3f\n', Vra_C  , Vla_C  , Vt_C  , Vrl_C  , Vll_C  );


