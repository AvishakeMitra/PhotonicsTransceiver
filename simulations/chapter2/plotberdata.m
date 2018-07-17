clc
clear all
close all

d = xlsread('BER data.xlsx');

d1 = d(2:end-32,:);
ptx_dbm = d1(:,2);
bertx = log10(d1(:,3));

x=ptx_dbm(1:end-3);
y=bertx(1:end-3);
c = polyfit(x,y,3);
bertx1=polyval(c,ptx_dbm);

d2 = d(5:end-14,:);
prx_dbm = d2(:,4);
berrx = log10(d2(:,5));

x=prx_dbm(1:end-2);
y=berrx(1:end-2);
c = polyfit(x,y,4);
berrx1=polyval(c,prx_dbm);


figure
hold on

p(1)=plot(ptx_dbm, bertx, 'sk', 'Linewidth',2)
plot(ptx_dbm, bertx1,'-k', 'Linewidth',2)

p(2)=plot(prx_dbm(1:end-1), berrx(1:end-1), '*k', 'Linewidth',2)
plot(prx_dbm, berrx1,'-k', 'Linewidth',2)

xlabel('Optical Power on PD (dBm)')
ylabel('log_{10}(BER)')

legend(p,'Upconversion','Downconversion')


%plot(ptx_dbm, bertx, 's', ptx_dbm,bertx1)
%plot(prx_dbm, berrx, 'x', prx_dbm, berrx1)

hold off