
stepLow = 20;
stepHigh = 100;

t = [0 2];
tRange = t(2)-t(1);
hHigh = tRange / stepLow;
hLow = tRange / stepHigh;

dy = @(t,y) -2*t.*y.^2;
yTrue = @(t) 1/(1+t.^2);
yTrueF = yTrue(t(2));
y0 = 1;
stepSizes = [hLow:.001:hHigh];
results = zeros(length(stepSizes),2);

i = 1;
for stepSize = stepSizes
   
    [tApx, yApx] = forwardEuler(dy, stepSize,t(1),t(2),y0);
    results(i,:) = [tRange/stepSize, abs(yTrueF - yApx(end))];
    i = i+1;
end
close ALL;
plot(results(:,1), results(:,2));
figure;
plot(log(results(:,1)),log(results(:,2)));