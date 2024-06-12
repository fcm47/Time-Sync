close all
clear
clc
v_light = 299792458;
f = 2444.97e6;
lambda = v_light/f;
load('../data/ExtFig7.mat');

CMC = P_SM0-L_SM0*lambda;
CMC_PLOT = CMC(1:end)-CMC(1);
figure(1)
subplot(2,1,1)
plot(CMC(1:end)-CMC(1))
ylim([-1.5, 1.5])
ylabel(['CMC (m)'])
CMC2 = P_MS0-L_MS0*lambda;
CMC2_PLOT = CMC2(1:end)-CMC(1);
subplot(2,1,2)
plot(CMC2(1:end)-CMC2(1))
ylim([-1.5,1.5])
ylabel(['CMC (m)'])
space = 1;
ref_clock = (L_SM0-L_MS0)/2*lambda;    %ns
input_prange_ns = ((P_SM0)-(P_MS0))/2; %ns
ref_clock = ref_clock(1:space:end)-(ref_clock(1));
input_prange_ns = input_prange_ns(1:space:end)-input_prange_ns(1);

std(input_prange_ns-ref_clock)
figure(2)
delta_P = (input_prange_ns(1:end)-ref_clock(1:end))-0.1;
plot(delta_P)
ylim([-1.5,1.5])
ylabel('Two-way (m)')

