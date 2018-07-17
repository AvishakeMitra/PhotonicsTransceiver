clc
clear all
close all

Va = [0.1 0.4 0.8 1 2];
Vpi = 4;

A= Va/Vpi * pi/2;


Vb = linspace(0.1,10,500);
B = Vb/Vpi * pi/2;

figure
hold on

for index=1:length(A)
    A1 = A(index);
    B1 = B;
    
    Pf = 1 * 0.25e-9/2 * (2*besselj(1,2*A1).*besselj(1,2*B1)).^2;
    Pf_dbm = 10*log10(Pf)+30;
    
    plot(B1, Pf_dbm, '-k', 'Linewidth', index/2)
end
legend(sprintf('A = %f rad',A(1)), ...
    sprintf('A = %f rad',A(2)),...
    sprintf('A = %f rad',A(3)),...
    sprintf('A = %f rad',A(4)),...
    sprintf('A = %f rad',A(5)))
xlabel('B (rad)')
ylabel('P(\omega_{RF})')
hold off