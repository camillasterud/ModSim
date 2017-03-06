clear; clc;
N = 5;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

figure(1)
hold on; grid on;
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);

sys5 = ss(A,B,C,D);


N = 10;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

figure(1)
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);

sys10 = ss(A,B,C,D);



N = 50;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

figure(1)
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);
print -depsc ex7_1c

sys50 = ss(A,B,C,D);

figure(2)
bode(sys5(1,1),sys10(1,1),sys50(1,1))
legend('N = 5','N = 10','N = 50')
print -depsc ex7_1c_bode_p1

figure(3)
bode(sys5(1,2),sys10(1,2),sys50(1,2))
legend('N = 5','N = 10','N = 50')
print -depsc ex7_1c_bode_pN