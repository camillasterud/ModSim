hold on; grid on;

kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;

yc = zeros (2,length(t));
yc(1,1) = 2;
yc(2,1) = 0;

f = @(yc) [yc(2);g*(yc(1)^(-kappa) - 1)];

opt = optimset('Display','off','TolFun',1e-8);

for i = 1:(length(t) - 1)
    
    r = @(ycnext) (yc(:,i) + h/2*feval(f, ycnext) - ycnext);
    yc(:,i+1) = fsolve(r, yc(:,i), opt);
    
end

plot(t,yc(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2c.eps