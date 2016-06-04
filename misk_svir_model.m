m = 0.02;
B = 1800;
g = 100;
p = 0.0;

I0 = 0.001;
V0 = 0.0;
R0 = 0.3;
s0 = [1-I0-R0-V0, V0, I0, R0];
t0 = 0;
tk = 50;

p = 0.0;
f = @(t,x) [m*(1-p)-(B*x(3)+m)*x(1); p*m-m*x(2); B*x(1)*x(3)-(m+g)*x(3); g*x(3)-m*x(4)];
opts = odeset('MaxStep',1/1000,'InitialStep',1/1000);
[t,x1] = ode45(f,[t0 tk],s0,opts);
p = 0.5;
f = @(t,x) [m*(1-p)-(B*x(3)+m)*x(1); p*m-m*x(2); B*x(1)*x(3)-(m+g)*x(3); g*x(3)-m*x(4)];
[t,x2] = ode45(f,[t0 tk],s0,opts);
p = 0.9;
f = @(t,x) [m*(1-p)-(B*x(3)+m)*x(1); p*m-m*x(2); B*x(1)*x(3)-(m+g)*x(3); g*x(3)-m*x(4)];
[t,x3] = ode45(f,[t0 tk],s0,opts);
p = 0.96;
f = @(t,x) [m*(1-p)-(B*x(3)+m)*x(1); p*m-m*x(2); B*x(1)*x(3)-(m+g)*x(3); g*x(3)-m*x(4)];
[t,x4] = ode45(f,[t0 tk],s0,opts);

hold on;
plot(t,x1(:,3))
plot(t,x2(:,3))
plot(t,x3(:,3))
plot(t,x4(:,3))
set(gca,'fontsize',20)
hold off;
title('I(t)')
xlabel('t'), ylabel('I')

figure;
hold on;
plot(t,x1(:,1))
plot(t,x2(:,1))
plot(t,x3(:,1))
plot(t,x4(:,1))
set(gca,'fontsize',20)
hold off;
title('S(t)')
xlabel('t'), ylabel('S')

figure;
hold on;
plot(t,x1(:,2))
plot(t,x2(:,2))
plot(t,x3(:,2))
plot(t,x4(:,2))
set(gca,'fontsize',20)
hold off;
title('V(t)')
xlabel('t'), ylabel('V')

figure;
hold on;
plot(t,x1(:,4))
plot(t,x2(:,4))
plot(t,x3(:,4))
plot(t,x4(:,4))
set(gca,'fontsize',20)
hold off;
title('R(t)')
xlabel('t'), ylabel('R')
