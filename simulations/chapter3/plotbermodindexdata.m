clc
clear all
close all

d = xlsread('Modulation Index vs BER 0 dBm laser.xlsx');

Vpi = 4;
alpha = pi/Vpi;
Vrf = d(:,1);
beta = Vrf.*alpha;

berup = log10(d(:,3));
berdn = log10(d(:,5));

% theoritically generate the plot
% Vrf_th = linspace(min(Vrf),max(Vrf),200);
% beta
%  
% start=1; stop=0;
% c = polyfit(beta(start:end-stop),beta(start:end-stop),3);
% x = beta_th;
% y = polyval(c, x);
% berup_th = y;
% 
% start=1; stop=1;
% c = polyfit(Prf_dbm(start:end-stop),berdn(start:end-stop),2);
% x = Prf_dbm_th;
% y = polyval(c, x);
% berdn_th = y;


%d1 = d(,:);
% ptx_dbm = d1(:,2);
% bertx = log10(d1(:,3));
% 
% x=ptx_dbm(1:end-3);
% y=bertx(1:end-3);
% c = polyfit(x,y,3);
% bertx1=polyval(c,ptx_dbm);
% 
% d2 = d(5:end-14,:);
% prx_dbm = d2(:,4);
% berrx = log10(d2(:,5));
% 
% x=prx_dbm(1:end-2);
% y=berrx(1:end-2);
% c = polyfit(x,y,4);
% berrx1=polyval(c,prx_dbm);
beta_th = linspace(min(beta),max(beta),200);
c = polyfit(beta,berdn,3);
berdn_th = polyval(c,beta_th);

figure
hold on

p(1) = plot(beta, berup, 'sk', 'Linewidth',2);
plot(beta, berup, '-k', 'Linewidth',2);

p(2) = plot(beta,berdn, '*k', 'Linewidth',2);
plot(beta_th, berdn_th,'-k', 'Linewidth',2)
xlabel('Modulation Index (B)')
ylabel('log_{10}(BER)')

legend(p,'Upconversion','Downconversion')

xlim([min(beta) max(beta)])
ylim([-40 1])

%plot(ptx_dbm, bertx, 's', ptx_dbm,bertx1)
%plot(prx_dbm, berrx, 'x', prx_dbm, berrx1)

hold off