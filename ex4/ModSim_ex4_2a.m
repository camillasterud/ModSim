hold on; grid on;

kappa = 1.4;
g = 9.81;

h = 0.01;
t = 0:h:10;

ya = zeros (2,length(t));
ya(1,1) = 2;
ya(2,1) = 0;

f = @(ya) [ya(2);g*(ya(1)^(-kappa) - 1)];

for i = 1:(length(t) - 1)
    
    k_1 = f(ya(:,i));
    k_2 = f(ya(:,i) + 0.5*h.*k_1);
    
    ya(:,i+1) = ya(:,i) + h.*k_2;
    
end

plot(t,ya(1,:));
xlabel('t(s)');
ylabel('x(m)');

print -depsc modsim_ex4_2a.eps

