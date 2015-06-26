close all
clc
clear

gen = importdata('output.txt');

%oscillation = 100*cos(gen(:,1));
%realdecay = 100*exp(-1*gen(:,1));
%sum(abs(realvalue - gen(:,2)))

initalValues = [50; -10; -11; 5];
timespan = [min(gen(:,1)) max(gen(:,1))];
[T,Y] = ode45(@finalOscillation,timespan,initalValues);

%subplot(2,1,1);
plot(gen(:,1),gen(:,2) ...
    ,T, Y(:,1));

title('Solution');
legend('x0','x0-ode45');
xlabel('time (s)');


% 
% subplot(2,1,2);
% plot(gen(:,1),abs(gen(:,2) - oscillation) ...
%     ,gen(:,1),abs(gen(:,4) - realdecay));
% 
% title('Errors in solution');
% legend('Absolute error-oscillation','Absolute error-decay')
% xlabel('time (s)');
% ylabel('abs(error) (m)');
% 
% errorOscillation = sum(abs(gen(:,2) - oscillation))/length(gen(:,2))
% errorDecay = sum(abs(gen(:,4) - realdecay))/length(gen(:,2))
