close all
clc
clear

gen = importdata('output.txt');

initialValues = [50; 0; 0; 50];
t = gen(:,1);
outputstep = 1000;

%perform manual euler integration (with double precision matlab)
xs = zeros(size(t,1),size(initialValues,1));
xs(1,:) = initialValues;

for s = 1:(size(t,1)-1)
    stepxs = xs(s,:)';
    step_timestep = (t(s+1) - t(s))/outputstep;
    
    for ss = 1:outputstep
        stepxs = stepxs + step_timestep * finalOscillation(0,stepxs);
    end
    
    xs(s+1,:) = stepxs';
end

figure(1)
track = 1;
realsol = 50 * cos(t);

subplot(2,1,1);
plot( t, gen(:,track+1) ... % fpga
    , t, xs(:,track),'.'... % matlab euler
    , t, realsol);          % analytical

title('Solution (\omega = 1)');
legend('FPGA','Matlab-Euler','Analytical');
ylabel('Value');
xlabel('time (s)');

subplot(2,1,2);
error_analytic = gen(:,track+1) - realsol;
error_number = gen(:,track+1) - xs(:,track);
% maxerror = [];
% 
% for i = 2:(size(error_analytic,1)-1)
%     if error_analytic(i-1) < error_analytic(i) && error_analytic(i+1) < error_analytic(i)
%        maxerror = [ maxerror; t(i) error_analytic(i);];  
%     end
% end
% 
% maxerrortime = maxerror(:,1);
% maxerrorval = maxerror(:,2);
% 
% % General model:
% %      f(x) = a*(exp(b*x)-1)
% % Coefficients (with 95% confidence bounds):
% %        a =       49.75  (48.94, 50.56)
% %        b =     0.00502  (0.004952, 0.005088)
% % 
% % Goodness of fit:
% %   SSE: 0.006271
% %   R-square: 1
% %   Adjusted R-square: 1
% %   RMSE: 0.02116
% 
% a = 49.75;
% b = 0.00502;

plot( t, error_analytic ...
    , t, error_number );



title('Error');
legend('FPGA - analytical', 'FPGA - matlab euler');
ylabel('Error');
xlabel('time (s)');


set(gcf,'paperunits','centimeters')
set(gcf,'papersize',[24,15]) % Desired outer dimensions
set(gcf,'paperposition',[-1,-1,26,16]) % Place plot on figure

print -dpdf myfigure.pdf

% figure(2)
% track = 3;
% realsol = 25 * sin(2*t);
% 
% subplot(2,1,1);
% plot( t, gen(:,track+1) ...
%     , T, Y(:,track) ...
%     , t, realsol);
% 
% title('Solution (\omega = 2)');
% legend('FPGA','ODE45','Analytical');
% xlabel('time (s)');
% 
% subplot(2,1,2);
% plot(t, realsol - gen(:,track+1));
% 
% title('Error');
% legend('difference between FGPA and analytical solutions');
% ylabel('error');
% xlabel('time (s)');
