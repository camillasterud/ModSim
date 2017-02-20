h = 0.01;
t = 0:h:20;
y0 = [1;4];

ya = zeros (2,length(t));
yb = zeros (2,length(t));
yc = zeros (2,length(t));
ya(:,1) = y0;
yb(:,1) = y0;
yc(:,1) = y0;

f = @(y) [y(1).*(y(2) - 3);y(2).*(2 - y(1))];
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

title('Explicit Euler');

plot(ya(1,:),ya(2,:));
xlabel('u(t)');
ylabel('v(t)');

print -depsc modsim_ex6_1d_ee.eps

figure;
hold on; grid on;

title('Implicit Euler');

plot(yb(1,:),yb(2,:));
xlabel('u(t)');
ylabel('v(t)');

print -depsc modsim_ex6_1d_ie.eps

figure;
hold on; grid on;

title('Implicit Midpoint Rule');

plot(yc(1,:),yc(2,:));
xlabel('u(t)');
ylabel('v(t)');
print -depsc modsim_ex6_1d_imr.eps

figure;
hold on; grid on;

title('V')

p0 = 2.5*10^5;
m = 200;
A = 0.01;

Eb = yb(1,:) - 2.*log(yb(1,:)) + yb(2,:) - 3.*log(yb(2,:));
Ec = yc(1,:) - 2.*log(yc(1,:)) + yc(2,:) - 3.*log(yc(2,:));

plot(t,Eb);
plot(t,Ec);
xlabel('t(s)');
ylabel('V');
legend('Implicit Euler','Implicit midpoint');

print -depsc modsim_ex6_1d_v.eps

figure;
hold on; grid on;

title('V for Explicit Euler')

Ea = ya(1,:) - 2.*log(ya(1,:)) + ya(2,:) - 3.*log(ya(2,:));

plot(t,Ea);
xlabel('t(s)');
ylabel('V');

print -depsc modsim_ex6_1d_vee.eps

