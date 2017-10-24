clc;
clear all;

V_fg = 1.96;

V_r = [0.79 0.77 0.70 0.62];

V_z = V_fg - V_r;

I = V_r / 1000;

Z = V_z ./ I;

fprintf('The values of voltage calculated across the resistor were: \n');
for i = 1:length(V_z)
   fprintf('%.2f\n',V_z(i)); 
end

fprintf('\n\nThe value of the current calculated in the circuit was: \n');
fprintf('%.2d\n',I(i));

fprintf('\n\nThe values of the impedances calculated in the circuit were: \n');

for j = 1:length(I)
    fprintf('%.2f\n',Z(j));
end
