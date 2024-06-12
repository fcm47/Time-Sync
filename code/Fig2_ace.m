close all
clear
clc
v_light = 299792458;
f = 2444.97e6;
lambda = v_light/f;
load ('../data/Fig2_ace.mat');

CMC = P_SM0-L_SM0*lambda;
CMC_PLOT = CMC - CMC(1);% remove phase ambiguity and Align to Zero
figure(1)
subplot(2,1,1)

plot(CMC_PLOT)
ylim([-10, 10])
ylabel(['CMC(m)'])
CMC2 = P_MS0-L_MS0*lambda;
CMC2_PLOT = CMC2 - CMC2(1);
subplot(2,1,2)
plot(CMC2_PLOT)
ylim([-10, 10])
ylabel(['CMC(m)'])
space = 1;

ref_clock = (L_SM0-L_MS0)/2*lambda;    % unit:m
twoway_P = ((P_SM0)-(P_MS0))/2; % unit:m
ref_clock = ref_clock(1:space:end)-(ref_clock(1));  
twoway_P = twoway_P(1:space:end)-twoway_P(1);    %remove hardware delay
twoway_P = (twoway_P(1:end)-ref_clock(1:end)); %remove clock drift
figure(2)
plot(twoway_P)
ylim([-7, 7])
ylabel('two-way (m)')
