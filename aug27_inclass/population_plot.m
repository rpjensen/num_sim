%%
r = .55;
k = 6;
dp = @(p) r.*p.*(1 - p./k) - (p.^2)./(1+p.^2);

%%
p = 0:.01:5;
close ALL;
plot(p, dp(p))

%%
for i = 1:length(p)
    if dp(p(i)) > 0 && dp(p(i+1))<0
        fprintf('%1.2f -- %1.2f\n', p(i), p(i+1));
    end
end

%% Spruce Bud system
[T, Y] = ode45(@spruceSystem, [0, 200], [.75 6]);
close ALL;
plot(T, Y(:,1));
hold on;
plot(T, .5.*Y(:,2), 'r--');
