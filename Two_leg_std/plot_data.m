figure(1);
subplot(2,1,1);
plot(left_x),grid on,hold on;
plot(target_x);
xlabel('time [s]');
ylabel('x [m]');
legend('x','x_d');

subplot(2,1,2);
plot(left_z),grid on;hold on;
plot(target_z);
xlabel('time [s]');
ylabel('z [m]');
legend('z','z_d');

figure(2);
plot(left_x.data,left_z.data),grid on,hold on;
plot(0,-0.9,'ro');
xlabel('x [m]');
ylabel('z [m]');
legend('locus','target');