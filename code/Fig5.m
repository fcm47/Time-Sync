clear
clc
load ('../data/Fig5.mat');

plot(data_m)
hold on
% Select some points for curve fitting
xlist = [1, 171,410,549, 711,988,1183,1336,1396];
ylist = [];
for i=1:length(xlist)
    ylist = [ylist, data_m(xlist(i))];
end
P = polyfit(xlist, ylist, 2);   %
xi = 1:length(data_m);
yi= polyval(P, xi');  %
yi_ = -yi;
plot(yi)
hold on
plot(-yi)
