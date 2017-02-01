hold on; grid on;

h = 0.01;
t = 0:h:10;

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