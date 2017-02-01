hold on; grid on;

kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;

y = zeros (2,length(t));
y(1,1) = 2;
y(2,1) = 0;

f = @(Y) [Y(2);g*(Y(1)^(-kappa) - 1)];

opt = optimset('Display','off','TolFun',1e-8);

for i = 1:(length(t) - 1)
    
    r = @(ynext) (y(:,i) + h*feval(f, ynext) - ynext);
    y(:,i+1) = fsolve(r, y(:,i), opt);
    
end

plot(t,y(1,:));
xlabel('t(s)');
ylabel('x(m)');
