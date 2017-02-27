N = 5;

L = 19.76;
beta = 1.7052*10^9;
rho = 870;
r = 6.17*10^(-3);
nu = 8*10^(-5);
area = pi*r^2;
c = sqrt(beta/rho);
Z_0 = rho*c/area;

A = zeros(N,N);
B = zeros(N,2);
C = zeros(2,N);
D = zeros(2,2);

C(1,1) = 1;
C(2,N) = 1;


B(1,1) = c^2*rho/(area*L);
B(N,2) = -c^2*rho/(area*L);

