clc;
clear all;

%These values are based on the circuit we are creating.

R1 = 1000;
R2 = 100000; %The gain is R2/R1. It drops to 0 when the C2 drops to 0. 

C1 = 2.2e-6; %C1 blocks the DC signal, used for the high pass filter since at low frequencies C1 goes to 0.
C2 = 1.5e-9; %C2 implements the low pass filter because at high frequencies C2 goes to 0. This makes the effective impedance (R2 and C2) go to zero.

gain = -R2/R1;

%Overall effect of the two filters is blocking DC signals (low frequency)
%and killing the gain at high frequencies so a band is able to pass through
%the filter of our specific frequency of interest. 

%These values are to give an ideal range of 1Hz to 1kHz to measure
%bioelectric signals since that range encompasses most electromyogram
%signals, which are the signals that will be collected by our filter.

f = 1 : 100000;
w = 2*pi*f;

fc1 = 1/(2*pi*R1*C1);
fc2 = 1/(2*pi*R2*C2);
fc1_ideal = 1;
fc2_ideal = 1000;

% R1_ideal = 
% R2_ideal = 
%  
% C1_ideal = 
% C2_ideal = 

bandwidth = fc2 - fc1;

const1 = R1*C1;
const2 = R2*C2;

freq = 0.01:0.01:1000;

low_transfer = 1./(1 + const1 * 1i * freq);
high_transfer = 1./(1 + 1./(const2 * 1i * freq));

transfer1 = low_transfer/high_transfer;
transfer2 = high_transfer/low_transfer;

low_3dB = 1./(1 + const1 * 1i * fc1);
high_3dB = 1./(1 + 1./(const2 * 1i * fc2));

m_low = 20 * log(abs(low_transfer)); %Converts the gain to decibals
m_high = 20 * log(abs(high_transfer)); %Converts the gain to decibals

phase_low = angle(low_transfer);
phase_high = angle(high_transfer);

band_pass_gainlow = 1./(1 + const1 * 1i * (bandwidth/2));
band_pass_gainhigh = 1./(1 + const1 * 1i * (bandwidth/2));

m_low_mid = 20 * log(abs(band_pass_gainlow));
m_high_mid = 20 * log(abs(band_pass_gainhigh));

fprintf('The first frequency of interest is fc1: %.3f\n', fc1);
fprintf('The second frequency of interest is fc2: %.3f\n', fc2);

fprintf('The bandwidth of signal frequency that is able to pass is the difference between fc1 and fc2 is: %.3f\n\n', bandwidth);

fprintf('The low pass 3dB point is: %.3f\n', low_3dB);
fprintf('The high pass 3dB point is: %.3f\n\n', high_3dB);

fprintf('The calculated low pass filter band pass gain is: %.3f\n', band_pass_gainlow);
fprintf('The calculated high pass filter band pass gain is: %.3f\n', band_pass_gainhigh);

fprintf('The band pass gain is -R2/R1: %.3f\n\n', gain);

fprintf('The max amplitude is %.3f\n', m_low_mid'); 
fprintf('The max amplitude is %.3f\n', m_high_mid'); 



% figure(1)
% subplot(2,1,1)
% semilogx(freq,m_low);
% grid on
% ylabel('Magnitude (dB)');
% 
% subplot(2,1,2)
% semilogx(freq,phase_low);
% grid on
% ylabel('Phase (deg)');
% xlabel('Frequency (Hz)');
% 
% figure(2)
% subplot(2,1,1)
% semilogx(freq,m_high);
% grid on
% ylabel('Magnitude (dB)');
% 
% subplot(2,1,2)
% semilogx(freq,phase_high);
% grid on
% ylabel('Phase (deg)');
% xlabel('Frequency (Hz)');
% 
% figure(3)
% hold on
% grid on
% semilogx(freq,m_low);
% semilogx(freq,m_high);
% xlabel('Frequency (Hz)');
% ylabel('Magnitude (dB)');
% hold off



%NOTCH FILTER CALCULATIONS%

%Goal of the notch filter is to allow all frequencies except a specific
%target frequency that is filtered out.

%Notch depth is affected by the tolerance used for all of the components in
%the filter. Typically this should be better than 1% tolerance.

C1 = 47e-9;
C2 = C1;

R1 = 10000;
R2 = 10000;
R3 = 68000;
R4 = R3;

Rnotch = R3;
Cnotch = C1;

fNotch = 1/(2*pi*Rnotch*Cnotch);

fprintf('\nThe notch frequency is: %.3f\n', fNotch);

