function plotData(vectors)

close all

gen = importdata('output.txt');

figure(1)
hold on
for i = vectors
    plot(gen(:,1),gen(:,i+1))
end

%plot(gen(:,1),50*cos(gen(:,1)),'*')
%plot(gen(:,1),-30*cos(gen(:,1)),'*')

hold off
end

