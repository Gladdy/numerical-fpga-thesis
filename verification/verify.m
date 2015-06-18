close all
clc
clear

gen = importdata('output.txt');

realsine = 50*cos(gen(:,1));
realdecay = 100*exp(-0.1*gen(:,1));
%sum(abs(realvalue - gen(:,2)))

plot(gen(:,1),gen(:,2) ...
    ,gen(:,1),realsine ...
    ,gen(:,1),gen(:,4) ...
    ,gen(:,1),realdecay);

legend('FPGA-sine','Analytical solution','FPGA-decay','Analytical solution');
xlabel('time (s)');
ylabel('position (m)');