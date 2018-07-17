clear all
close all
clc

% plot all data from data.xlsx
d = xlsread('data.xlsx');

laser_power = d(1,1); % laser power in dbm
vpi = d(1,2);   % vpi of MZM in volt
v = d(:,3);     % all voltages
d_f1 = d(:,4)*1e-12;  % fundamental tone voltages
d_fimd = d(:,5)*1e-12;  % IMD voltages
b = v;%((pi/2)/vpi).*v;        % in radian

p_v = (b.^2)/2; % convert to optisystem watts
b1=10*log10(p_v(3:28));
d1=10*log10(d_f1(3:28));

b2=10*log10(p_v(14:36));
d2=10*log10(d_fimd(14:36));

%plot(b1,d1,'x',b2,d2,'o'), grid on

P1 = polyfit(b1(1:end-15),d1(1:end-15),1);
P2 = polyfit(b2(1:end-7),d2(1:end-7),1);
 
ending=21.2;
fit_b1 =-13:0.1:ending;
fit_d1=P1(1).*fit_b1+P1(2);
fit_b2 =-0.4:0.1:ending;
fit_d2=P2(1).*fit_b2+P2(2);
%  
 plot(b1,d1,'x',b2,d2,'o',fit_b1,fit_d1,'-',fit_b2,fit_d2,'-'), grid on