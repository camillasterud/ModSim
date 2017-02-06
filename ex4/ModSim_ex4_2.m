kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;
y0 = [2;0];

ya = zeros (2,length(t));
yb = zeros (2,length(t));
yc = zeros (2,length(t));
ya(:,1) = y0;
yb(:,1) = y0;
yc(:,1) = y0;

f = @(y) [y(2);g*(y(1)^(-kappa) - 1)];
opt = optimset('Display','off','TolFun',1e-8);


for i = 1:(length(t) - 1)
    ya(:,i+1) = ya(:,i) + h*feval(f,ya(:,i));
    
    rb = @(ybnext) (yb(:,i) + h*feval(f, ybnext) - ybnext);
    yb(:,i+1) = fsolve(rb, yb(:,i), opt);
    
    rc = @(ycnext) (yc(:,i) + h*feval(f, (ycnext+yc(:,i))/2) - ycnext);
    yc(:,i+1) = fsolve(rc, yc(:,i), opt);
end


figure;
hold on; grid on;

plot(t,ya(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2a.eps

figure;
hold on; grid on;

plot(t,yb(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2b.eps

figure;
hold on; grid on;

plot(t,yc(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2c.eps

figure;
hold on; grid on;

p0 = 2.5*10^5;
m = 200;
A = 0.01;

Ea = (1/(kappa-1))*p0*A.*ya(1,:).^(1-kappa) + m*g.*ya(1,:) + 0.5*m.*ya(2,:).^2;
Eb = (1/(kappa-1))*p0*A.*yb(1,:).^(1-kappa) + m*g.*yb(1,:) + 0.5*m.*yb(2,:).^2;
Ec = (1/(kappa-1))*p0*A.*yc(1,:).^(1-kappa) + m*g.*yc(1,:) + 0.5*m.*yc(2,:).^2;


plot(t,Ea);
plot(t,Eb);
plot(t,Ec);
xlabel('t(s)');
ylabel('E(J)');
legend('Explicit Euler','Implicit Euler','Implicit midpoint');

print -depsc modsim_ex4_2d.eps

