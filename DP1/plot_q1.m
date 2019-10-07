figure(1);
subplot(6,1,1);
plot(tout,y(:,1),'linewidth',1.5);
ylabel('\phi')
hold on;
plot(tout,x_hat(:,1),'--','linewidth',1.5);
subplot(6,1,2);
plot(tout,y(:,2),'linewidth',1.5);
ylabel('\theta')
hold on;
plot(tout,x_hat(:,2),'--','linewidth',1.5);
subplot(6,1,3);
plot(tout,y(:,3),'linewidth',1.5);
ylabel('p')
hold on;
plot(tout,x_hat(:,3),'--','linewidth',1.5);
subplot(6,1,4);
plot(tout,y(:,4),'linewidth',1.5);
ylabel('q')
hold on;
plot(tout,x_hat(:,4),'--','linewidth',1.5);
subplot(6,1,5);
plot(tout,y(:,5),'linewidth',1.5);
ylabel('r')
hold on;
plot(tout,x_hat(:,7),'--','linewidth',1.5);
subplot(6,1,6);
plot(tout,y(:,6),'linewidth',1.5);
ylabel('\psi')
xlabel('time/sec')
hold on;
plot(tout,x_hat(:,9),'--','linewidth',1.5);
legend('Measured States','Filtered States','location','northeast');
figure(2);
subplot(3,1,1);
plot(tout,x_hat(:,5),'--','linewidth',1.5);
ylabel('a_s')
subplot(3,1,2);
plot(tout,x_hat(:,6),'--','linewidth',1.5);
ylabel('b_s')
subplot(3,1,3);
plot(tout,x_hat(:,8),'--','linewidth',1.5);
ylabel('\delta_{ped,int}')
legend('Filtered States','location','northeast');
xlabel('time/sec')
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
