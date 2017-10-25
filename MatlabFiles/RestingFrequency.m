clc;
clear all;

L = [6.8e-3, 3.3e-3, 15e-3, 15e-3];
C = [68e-9, 68e-9, 33e-9, 15e-9];

f0 = 1 ./ (2 .* pi .* sqrt(L .* C));

fprintf('Resonant frequencies: ');

for i = 1 : length(L)
    fprintf('\n%.2f', f0(i));
end

fprintf('n');