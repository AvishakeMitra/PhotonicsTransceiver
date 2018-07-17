clc
clear all
close all

data = xlsread('Upconversion Data 60 GHz 5GHZ 4 dBm Laser.xlsx');

A = (data(:,3)./data(:,2))*(pi/2);
B = (data(:,5)./data(:,4))*(pi/2); % Modulation Index of MZM2

Pin = data(1,1);
Pdc = 1.6e-9;
Bth = linspace(1*min(B),max(B)*1.05, 100);
Ath = A(1);

P5g = 10*log10(data(:,8))+30;
P5gth_w = (1 * Pdc/2 )*(2*besselj(1,2*Bth)).^2;
P5gth = 10*log10(P5gth_w)+30;

P15g = 10*log10(data(:,9))+30;
P15gth_w = (1 * Pdc/2 )*(2*besselj(3,2*Bth)).^2;
P15gth = 10*log10(P15gth_w)+30;

P45g = 10*log10(data(:,10))+30;
P45gth_w = (1.1 * Pdc/2 )*(2*besselj(1,2*Ath)*besselj(3,2*Bth)).^2;
P45gth = 10*log10(P45gth_w)+30;

P55g = 10*log10(data(:,11))+30;
P55gth_w = (1.1 * Pdc/2 )*(2*besselj(1,2*Ath)*besselj(1,2*Bth)).^2;
P55gth = 10*log10(P55gth_w)+30;

P65g = 10*log10(data(:,13))+30;
P65gth_w = (1 * Pdc/2 )*(2*besselj(1,2*Ath)*besselj(1,2*Bth)).^2;
P65gth = 10*log10(P65gth_w)+30;

P75g = 10*log10(data(:,14))+30;
P75gth_w = (1 * Pdc/2 )*(2*besselj(1,2*Ath)*besselj(3,2*Bth)).^2;
P75gth = 10*log10(P75gth_w)+30;

% figure
% hold on
% plot(B, P5g, 'sk', 'Linewidth',2)
% plot(Bth, P5gth,'-k', 'Linewidth',2)
% plot(B, P15g, '*k', 'Linewidth',2)
% plot(Bth, P15gth,'-.k', 'Linewidth',2)
% xlabel('B (radians)')
% ylabel('P (dBm)')
% legend('Simulated Data at 5 Ghz', ...
%     'Data at 5 GHz obtained from Formula', ...
%     'Simulated Data at 15 GHz', ...
%     'Data at 15 GHz obtained from Formula')
% hold off    
    

% figure
% hold on
% plot(B, P55g, 'sk', 'Linewidth',2)
% plot(Bth, P55gth,'-k', 'Linewidth',2)
% plot(B, P45g, '*k', 'Linewidth',2)
% plot(Bth, P45gth,'-.k', 'Linewidth',2)
% xlabel('B (radians)')
% ylabel('P (dBm)')
% legend('Simulated Data at 55 Ghz', ...
%     'Data at 55 GHz obtained from Formula', ...
%     'Simulated Data at 45 GHz', ...
%     'Data at 45 GHz obtained from Formula')
% hold off   

figure
hold on
plot(B, P65g, 'sk', 'Linewidth',2)
plot(Bth, P65gth,'-k', 'Linewidth',2)
plot(B, P75g, '*k', 'Linewidth',2)
plot(Bth, P75gth,'-.k', 'Linewidth',2)
xlabel('B (radians)')
ylabel('P (dBm)')
legend('Simulated Data at 65 Ghz', ...
    'Data at 65 GHz obtained from Formula', ...
    'Simulated Data at 75 GHz', ...
    'Data at 75 GHz obtained from Formula')
hold off   