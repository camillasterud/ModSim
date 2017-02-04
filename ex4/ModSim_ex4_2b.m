hold on; grid on;

kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;

yb = zeros (2,length(t));
yb(1,1) = 2;
yb(2,1) = 0;

f = @(yb) [yb(2);g*(yb(1)^(-kappa) - 1)];

opt = optimset('Display','off','TolFun',1e-8);

for i = 1:(length(t) - 1)
    
    r = @(ybnext) (yb(:,i) + h*feval(f, ybnext) - ybnext);
    yb(:,i+1) = fsolve(r, yb(:,i), opt);
    
end

plot(t,yb(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2b.eps