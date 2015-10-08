% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Homework 6

%% Problem 1.a
clc
xMin = 0;
xMax = 8;

x = xMin:.01:xMax;
y = exppdf(x, 2);

close ALL;
figure
plot(x,y, 'k-')

%% Problem 1.b
clc
xMin = 0;
xMax = 8;

x = xMin:.01:xMax;
y = expcdf(x, 2);

close ALL;
figure
plot(x,y, 'k-')

%% Problem 1.c
clc
xMin = 0;
xMax = 8;

h = exprnd(2, 10^5, 1);% Total Area: 10^5/3 ==> mult by 3/10^5
x = xMin:.01:xMax;
y = exppdf(x, 2);



close ALL;
figure
hist(h, 0:.33:15)
set(gca,'xlim',[xMin xMax])


%% Problem 1.d
clc
xMin = 0;
xMax = 8;

h = exprnd(2, 10^5, 1);% Total Area: 10^5/3 ==> mult by 3/10^5
x = xMin:.01:xMax;
% Unfortunetly due to the limitations of hist (mac 2013a version) I can only normalize by
% bringing the function up to the histogram's total area instead of the histogram 
% down to an area of 1. The internet said that one limitation of hist is 
% that normalizing had to be done manually.
y = (10^5/3)*exppdf(x, 2);



close ALL;
figure
hist(h, 0:.33:15)
set(gca,'xlim',[xMin xMax])
hold on;
plot(x,y,'ro')


%% Problem 1.e
% See: minRand.m

%% Problem 1.f
clc
xMin = 0;
xMax = 8;

h = minRand(10^5);% Total Area: 10^5/3 ==> mult by 3/10^5

m = mean(h);
fprintf('The mean of %f repititions was %f', 10^5, m);
x = xMin:.01:xMax;
% Unfortunetly due to the limitations of hist (mac 2013a version) I can only normalize by
% bringing the function up to the histogram's total area instead of the histogram 
% down to an area of 1. The internet said that one limitation of hist is 
% that normalizing had to be done manually.
y = (10^5/3)*exppdf(x, 1);



close ALL;
figure
hist(h, 0:.33:15)
set(gca,'xlim',[xMin xMax])
hold on;
plot(x,y,'ro')

%% Problem 1.g
% See atomDecay.m

%% Problem 1.h
clc
N = 25;
times = atomDecay(N, 1/2);

% append 0 to the times
close ALL;
figure
times = [0; times];
stairs(times,N:-1:0);
xlim([0 max(times)*1.1]);

