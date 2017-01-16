J_m = 1;

J_i = 1;
K = 0.5;
D = 0.01;

sim('ModSim_ex1_2');
hold on;
grid on;

plot(w_2.Time, w_2.Data);
plot(w_1.Time, w_1.Data);
plot(w_m.Time, w_m.Data);

legend('2. load','1. load','Motor');

ylabel('\omega (rad/s)')
xlabel('t (s)')