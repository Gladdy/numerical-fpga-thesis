function plotData(vectors)

close all

gen = importdata('output.txt');

figure(1)
hold on
for i = vectors
    plot(gen(:,1),gen(:,i+1))
end

hold off

title('Data');
ylabel('Value');
xlabel('time (s)');

end

