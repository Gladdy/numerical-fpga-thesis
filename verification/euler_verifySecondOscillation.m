close all
clc
clear

gen = importdata('output.txt');

initialValues = [50; 0; 0; 50];
t = gen(:,1);
outputstep = 1;

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
track = 3;
realsol = 25 * sin(2*t);

subplot(2,1,1);
plot( t, gen(:,track+1) ... % fpga
    , t, xs(:,track),'.'... % matlab euler
    , t, realsol);          % analytical

title('Solution (\omega = 2)');
legend('FPGA','Matlab-Euler','Analytical');
ylabel('Value');
xlabel('time (s)');

subplot(2,1,2);
error_analytic = gen(:,track+1) - realsol;
error_number = gen(:,track+1) - xs(:,track);

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