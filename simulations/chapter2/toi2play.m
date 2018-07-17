clc
clear all
close all

data = xlsread('TOI 0dbm 8V.xlsx');
Vrf = data(:,2);
Vpi = data(1,3);
Prf_dbm = 10*log10(data(:,4))+30;
Pf_dbm = 10*log10(data(:,5))+30;
P3f_dbm = 10*log10(data(:,6))+30;

Prf_dbm_th = linspace(min(Prf_dbm)*0.8,max(Prf_dbm)*1.225,100);

Prf_dbm_th1 = linspace(min(Prf_dbm)*0.8,max(Prf_dbm)*1.225,500);
Prf_th = 10.^((Prf_dbm_th1-30)/10);
Vrf_th =sqrt(2*Prf_th);
B = Vrf_th/Vpi * pi/2;

Pf_dbm_th = -107.287+1.00572*Prf_dbm_th;
P3f_dbm_th = -196.879+2.75862*Prf_dbm_th;

Pf_formula = 0.52 * 0.25e-9/2 * (2*besselj(1,2*B)).^2;
Pf_dbm_formula = 10*log10(Pf_formula)+30;

P3f_formula = 0.52 * 0.25e-9/2 * (2*besselj(3,2*B)).^2;
P3f_dbm_formula = 10*log10(P3f_formula)+30;

figure
hold on
plot(Prf_dbm, Pf_dbm, 'sk', 'Linewidth',2)
plot(Prf_dbm_th1, Pf_dbm_formula,'-k', 'Linewidth',2)
plot(Prf_dbm_th(30:end), Pf_dbm_th(30:end),'.k', 'Linewidth',1)
 
plot(Prf_dbm, P3f_dbm, '*k', 'Linewidth',2)
plot(Prf_dbm_th1(200:end), P3f_dbm_formula(200:end),'-k', 'Linewidth',1)
plot(Prf_dbm_th(60:end), P3f_dbm_th(60:end),'.k', 'Linewidth',2)

xlabel('P_{RF} (dBm)')
ylabel('P (dBm)')

 legend('Simulated data at 5 GHz', ...
     'Data at 5 GHz obtained from Formula', ...
     'Extrapolated line for 5 GHz', ...
     ...
     'Simulated data at 15 GHz',...
     'Data at 15 GHz obtained from Formula', ...
     'Extrapolated line for 15 GHz')
ylim([-130 -30])
hold off   