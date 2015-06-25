function plotData(amount)

close all

gen = importdata('output.txt');

figure(1)
hold on
for i = 2:(amount+1)
    plot(gen(:,1),gen(:,i))
end

plot(gen(:,1),50*cos(gen(:,1)),'.')
plot(gen(:,1),-30*cos(gen(:,1)),'.')

hold off
end

