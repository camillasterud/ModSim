L = 19.76;
beta = 1.7052*10^9;
rho = 870;
r = 6.17*10^(-3);
nu = 8*10^(-5);
area = pi*r^2;
c = sqrt(beta/rho);
h = L/N;
Z_0 = rho*c/area;
b = 8*nu/r^2;


x_0 = zeros(N+N-1,1);
tsim = 5;

A = zeros(N+N-1,N+N-1);
B = zeros(N+N-1,2);
C = zeros(2,N+N-1);
D = zeros(2,2);

C(1,1) = 1;
C(2,N +N-1) = 1;


B(1,1) = c^2*rho/(area*h);
B(N+N-1,2) = -c^2*rho/(area*h);

v = repmat([0 -b], 1,N-1);
v(1,N + N -1) = 0;

A = diag(v);

v = repmat([-c^2*rho/(area*h) -area/(rho*h)], 1,N-1);

A = A + diag(v,1);

v = repmat([area/(rho*h) c^2*rho/(area*h)], 1,N-1);

A = A + diag(v,-1);