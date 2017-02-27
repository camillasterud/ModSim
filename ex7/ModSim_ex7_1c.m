N = 5;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

figure(1)
hold on; grid on;
subplot(3,1,1);
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);
title('N = 5')


N = 10;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

subplot(3,1,2);
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);
title('N = 10')

N = 50;

ModSim_ex7_1c_init;

sim('ModSim_ex7_1c_model')

subplot(3,1,3);
plot(p_1.Time, p_1.Data, p_N.Time, p_N.Data);
title('N = 50')
legend('p_1','p_N')
