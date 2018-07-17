clc
clear all
close all

data = xlsread('TOI data 2 dBm laser 5 GHZ minus 5.97dBM PD power.xlsx');

Vrf = data(:,1);
Prf_w = (Vrf.^2)/2;
Prf_mw= Prf_w/1e-3;
Prf_dbm = 10*log10(Prf_mw); 

P5ghz_dbm = 10*log10(data(:,2)/1e-3);
P15ghz_dbm = 10*log10(data(:,3)/1e-3);


% theroritical curve fitting
Pdc_w = 6.370219e-8;    % DC power detected from photodiode (from sim.)

Vrf_th = linspace(min(Vrf), max(Vrf)*1.8,200);
Prf_w_th = (Vrf_th.^2)/2;
Prf_mw_th= Prf_w_th/1e-3;
Prf_dbm_th = 10*log10(Prf_mw_th); 

P5ghz_w_th =(1)*(Pdc_w/2)*(2*besselj(1,2*Vrf_th/4 * pi)).^2; 
P5ghz_dbm_th = 10*log10(P5ghz_w_th/1e-3);

P15ghz_w_th =(1)*(Pdc_w/2)*(2*besselj(3,2*Vrf_th/4 * pi)).^2; 
P15ghz_dbm_th = 10*log10(P15ghz_w_th/1e-3);

% draw theoritical straight line
x1_5 =Prf_dbm(1); y1_5 = P5ghz_dbm(1);
x2_5 =Prf_dbm(3); y2_5 = P5ghz_dbm(3);
slope_5=(y1_5-y2_5)/(x1_5-x2_5);

xgen = linspace(min(Prf_dbm_th),max(Prf_dbm_th)*0.965,200);
y5gen = y1_5 + slope_5*(xgen-x1_5);

x1_15 =Prf_dbm(7); y1_15 = P15ghz_dbm(7);
x2_15 =Prf_dbm(14); y2_15 = P15ghz_dbm(14);
slope_15=(y1_15-y2_15)/(x1_15-x2_15);
y15gen = y1_15 + slope_15*(xgen-x1_15);



figure, hold on
plot(Prf_dbm, P5ghz_dbm,'sk', 'Linewidth',2)
plot(Prf_dbm_th, P5ghz_dbm_th,'-k','Linewidth',2)
plot(xgen, y5gen,'.k', 'Linewidth',1)

plot(Prf_dbm(4:end), P15ghz_dbm(4:end),'*k', 'Linewidth',2)
plot(Prf_dbm_th(12:end), P15ghz_dbm_th(12:end), '-k', 'Linewidth',1)
plot(xgen(110:end), y15gen(110:end),'.k','Linewidth',2)

ylim([-100 -10])
xlim([0 max(Prf_dbm_th)])

xlabel('P_{RF} (dBm)')
ylabel('P (dBm)')
legend('Simulated data at 5 GHz', ...
    'Data at 5 GHz obtained from Formula', ...
    'Extrapolated line for 5 GHz', ...
    ...
    'Simulated data at 15 GHz',...
    'Data at 15 GHz obtained from Formula', ...
    'Extrapolated line for 15 GHz')

hold off