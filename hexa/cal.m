interval = [0,10];
qinit = [4,4,4];
[time q] = ode45(@kadai,interval,qinit);

plot(q(:,1),q(:,2));
pause;

plot(q(:,2),q(:,3));
pause;

plot(q(:,3),q(:,1));
pause;