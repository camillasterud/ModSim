hold on; grid on;

kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;

y = zeros (2,length(t));
y(1,1) = 2;
y(2,1) = 0;

f = @(Y) [Y(2);g*(Y(1)^(-kappa) - 1)];

for i = 1:(length(t) - 1)
    
    k_1 = f(y(:,i));
    k_2 = f(y(:,i) + 0.5*h.*k_1);
    
    y(:,i+1) = y(:,i) + h.*k_2;
    
end

plot(t,y(1,:));
xlabel('t(s)');
ylabel('x(m)');

p0 = 2.5*10^5;
m = 200;
A = 0.01;

E = (1/(kappa-1))*p0*A.*y(1,:).^(1-kappa) + m*g.*y(1,:) + 0.5*m.*y(2,:).^2;

figure;

plot(t,E);
xlabel('t(s)');
ylabel('energy(J)');
