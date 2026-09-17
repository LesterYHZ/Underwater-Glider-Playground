clear; clc; close all; 

%% run simulation 
out = sim('UG_model.slx');

%% extract data
time = out.tout; time = transpose(time);
eta = out.eta; eta = reshape(eta,6,length(time));
nu = out.nu; nu = reshape(nu,6,length(time));
U = out.U; U = transpose(U);

%% plot trajectory
figure('Name','Trajectory');
subplot(2,2,1)
plot3(eta(1,:),eta(2,:),eta(3,:),'LineWidth',1.5);
xlabel('x [m]'); ylabel('y [m]'); zlabel('z [m]');
set(gca,'Zdir','reverse'); grid on;
subplot(2,2,2) 
yyaxis left
plot(eta(1,:),eta(2,:),'LineWidth',1.5);
ylabel('y [m]'); xlabel('x [m]'); grid on; 
yyaxis right
plot(eta(1,:),eta(3,:),'LineWidth',1.5);
ylabel('z [m]'); 
set(gca,'Ydir','reverse'); grid on; axis equal;
subplot(2,2,3)
plot(time,eta(1,:),'LineWidth',1.5); hold on;
plot(time,eta(2,:),'LineWidth',1.5); 
plot(time,eta(3,:),'LineWidth',1.5);
legend('x','y','z');
xlabel('time [s]'); ylabel('position [m]'); grid on;
subplot(2,2,4)
plot(time,eta(4,:),'LineWidth',1.5); hold on;
plot(time,eta(5,:),'LineWidth',1.5);
plot(time,eta(6,:),'LineWidth',1.5);
legend('\phi','\theta','\psi');
xlabel('time [s]'); ylabel('angle [rad]'); grid on;

%% plot velocity
figure('Name','Velocity');
yyaxis left
plot(time,nu(1,:),'LineWidth',1.5); hold on;
plot(time,nu(2,:),'LineWidth',1.5);
plot(time,nu(3,:),'LineWidth',1.5);
xlabel('time [s]'); ylabel('linear velocity [m/s]'); grid on;
yyaxis right
plot(time,nu(4,:),'LineWidth',1.5); hold on;
plot(time,nu(5,:),'LineWidth',1.5);
plot(time,nu(6,:),'LineWidth',1.5);
legend('u','v','w','p','q','r');
xlabel('time [s]'); ylabel('angular velocity [rad/s]'); grid on;

%% plot control effort
figure('Name','Control Effort');
subplot(3,1,1)
plot(time,U(1,:),'LineWidth',1.5); 
ylabel('m_b [kg]'); grid on;
subplot(3,1,2)
plot(time,U(2,:),'LineWidth',1.5);
ylabel('r_{p1} [m]'); grid on;
subplot(3,1,3)
plot(time,U(3,:),'LineWidth',1.5);
ylabel('\gamma [rad]'); grid on;
xlabel('time [s]');