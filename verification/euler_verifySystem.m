close all
clc
clear

gen = importdata('output.txt');
t = gen(:,1);
interval = [min(t) max(t)];

% CONFIGURATION PARAMETERS
initialValues = [7; 5; 7; 5];
outputstep = 1;
track = 1;

% MATLAB EULER FOR VERIFICATION
xs = zeros(size(t,1),size(initialValues,1));
xs(1,:) = initialValues;

for s = 1:(size(t,1)-1)
    stepxs = xs(s,:)';
    step_timestep = (t(s+1) - t(s))/outputstep;
    
    for ss = 1:outputstep
        stepxs = stepxs + step_timestep * finalNegEig(0,stepxs);
    end
    
    xs(s+1,:) = stepxs';
end

% ODE45 FOR VERIFICATION
[~,Y] = ode45(@finalNegEig,t,initialValues);

% SOLUTIONS
subplot(2,1,1);
plot(   t, gen(:,track+1), ...  % fpga
        t, xs(:,track), ...     % matlab rk2
        t, Y(:,track));         % ode45

title('Solution');
legend('FPGA','Matlab-Euler','ODE45');
ylabel('Value');
xlabel('time (s)');

% ERRORS
subplot(2,1,2);
error_ode45 = gen(:,track+1) - Y(:,track); 
error_number = gen(:,track+1) - xs(:,track);

plot( t, error_ode45 ...
    , t, error_number );



title('Error');
legend('FPGA - ODE45', 'FPGA - matlab euler');
ylabel('Error');
xlabel('time (s)');


set(gcf,'paperunits','centimeters')
set(gcf,'papersize',[24,15]) % Desired outer dimensions
set(gcf,'paperposition',[-1,-1,26,16]) % Place plot on figure

print -dpdf myfigure.pdf
