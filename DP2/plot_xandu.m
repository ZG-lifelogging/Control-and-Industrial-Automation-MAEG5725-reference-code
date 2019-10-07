figure(1);
subplot(5,1,1);
plot(tout,x(:,1),'linewidth',1.5);
ylabel('\phi')
hold on;
subplot(5,1,2);
plot(tout,x(:,2),'linewidth',1.5);
ylabel('\theta')
hold on;
subplot(5,1,3);
plot(tout,x(:,3),'linewidth',1.5);
ylabel('p')
hold on;
subplot(5,1,4);
plot(tout,x(:,4),'linewidth',1.5);
ylabel('q')
hold on;
subplot(5,1,5);
plot(tout,x(:,5),'linewidth',1.5);
ylabel('a_s')
xlabel('time/sec');
hold on;

figure(2);
subplot(4,1,1);
plot(tout,x(:,6),'linewidth',1.5);
ylabel('b_s')
hold on;
subplot(4,1,2);
plot(tout,x(:,7),'linewidth',1.5);
ylabel('r')
hold on;
subplot(4,1,3);
plot(tout,x(:,8),'linewidth',1.5);
ylabel('\delta_{ped,int}')
hold on;
subplot(4,1,4);
plot(tout,x(:,9),'linewidth',1.5);
ylabel('\Psi')
xlabel('time/sec');
hold on;


figure(3);
subplot(3,1,1);
plot(tout,u(:,1),'-r','linewidth',1.5);
ylabel('\delta_{lat}')
subplot(3,1,2);
plot(tout,u(:,2),'-r','linewidth',1.5);
ylabel('\delta_{lon}')
subplot(3,1,3);
plot(tout,u(:,3),'-r','linewidth',1.5);
ylabel('\delta_{ped}')
xlabel('time/sec')

figure(4);
subplot(3,1,1);
plot(tout,w_disturb(:,1),'-r','linewidth',1.5);
ylabel('u_{wind}')
subplot(3,1,2);
plot(tout,w_disturb(:,2),'-r','linewidth',1.5);
ylabel('v_{wind}')
subplot(3,1,3);
plot(tout,w_disturb(:,3),'-r','linewidth',1.5);
ylabel('w_{wind}')
xlabel('time/sec')