tspan = [0 1];
h0 = 2;
Cv = 0.15;
rho = 1000;
A = 4.5;
g = 10;


[t,h] = ode45(@(t,h) -(Cv/A)*sqrt(rho*g*h), tspan, h0);

plot(t,h,'-o')