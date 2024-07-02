close all
clear
clc
v_light = 299792458;
f = 2444.97e6; % frequence of carrier
lambda = v_light/f;
load('../data/ExtFig5.mat');

CMC = P_SM0-L_SM0*lambda;   % Code Minus Carrier
wind_up = zeros(length(CMC), 1);    
start = 160;
% Simplified wind_up
wind_up(start:start+90) = 0:1/90:1;
wind_up(start+90:start+90+120) = 1;
wind_up(start+90+60:start+90+60+90) = 1:-1/90:0;
wind_up = wind_up*lambda;
CMC = CMC - wind_up;
CMC_PLOT = CMC(1:end)-CMC(1);
figure(1)
subplot(2,1,1)
plot(CMC(1:end)-CMC(1))
ylim([-1.5, 1.5])
ylabel(['CMC(m)'])
CMC2 = P_MS0-L_MS0*lambda;
CMC2 = CMC2 - wind_up;
CMC2_PLOT = CMC2(1:end)-CMC2(1);
subplot(2,1,2)
plot(CMC2(1:end)-CMC2(1))
ylim([-1.5,1.5])
ylabel(['CMC(m)'])

space = 1;

ref_clock = (L_SM0-L_MS0)/2*lambda;    % two-way carrier, unit:m
twoway_P = ((P_SM0)-(P_MS0))/2; % unit:m
ref_clock = ref_clock(1:space:end)-(ref_clock(1));  
twoway_P = twoway_P(1:space:end)-twoway_P(1);    %remove hardware delay
twoway_P = (twoway_P(1:end)-ref_clock(1:end)); %remove clock drift
figure(2)
plot(twoway_P)
ylim([-1.5, 1.5])
ylabel('two-way (m)')

