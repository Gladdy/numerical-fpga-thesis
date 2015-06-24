close all
clc
clear

gen = importdata('output.txt');

oscillation = 100*cos(gen(:,1));
realdecay = 100*exp(-1*gen(:,1));
%sum(abs(realvalue - gen(:,2)))

subplot(2,1,1);
plot(gen(:,1),gen(:,2) ...
    ,gen(:,1),oscillation ...
    ,gen(:,1),gen(:,4) ...
    ,gen(:,1),realdecay);

title('Solution');
legend('FPGA-oscillation','Analytical-oscillation','FPGA-decay','Analytical-decay');
xlabel('time (s)');
ylabel('position (m)');

subplot(2,1,2);
plot(gen(:,1),abs(gen(:,2) - oscillation) ...
    ,gen(:,1),abs(gen(:,4) - realdecay));

title('Errors in solution');
legend('Absolute error-oscillation','Absolute error-decay')
xlabel('time (s)');
ylabel('abs(error) (m)');

errorOscillation = sum(abs(gen(:,2) - oscillation))/length(gen(:,2))
errorDecay = sum(abs(gen(:,4) - realdecay))/length(gen(:,2))
