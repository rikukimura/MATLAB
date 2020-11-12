% Walking Robot Parameters -- Reinforcement Learning
% Copyright 2020 The MathWorks, Inc.
%単位は[cm],[kg],[rad]で定義
D2R=pi/180;
R2D=180/pi;
alm_density=2.7E-3;%アルミニウムの密度[kg/cm^3]
%% body %%
    body.length=50;
    body.width=30;
    body.height=5;
    body.dim=[body.length,body.width,body.height];
    body.mass=1;
    body.color=[1,1,1];
    body.den = 0;
%% arm1 %%
    arm1.length=5;
    arm1.width=5;
    arm1.height=20;
    arm1.dim=[arm1.length,arm1.width,arm1.height];
    arm1.mass=1;
    arm1.color=[1,0.6,0.2];
    arm1.den=0;
%% arm2 %%
    arm2.length=5;
    arm2.width=5;
    arm2.height=20;
    arm2.dim=[arm2.length,arm2.width,arm2.height];
    arm2.mass=1;
    arm2.color=[0.5,1,0.5];
    arm2.den=0;
%% arm3 %%
    arm3.length=5;
    arm3.width=5;
    arm3.height=20;
    arm3.dim=[arm3.length,arm3.width,arm3.height];
    arm3.mass=1;
    arm3.color=[0.1,0.1,1];
    arm3.den=0;
    foot_radius=4;
%% joint %%
    joint.radius=4;
    joint.length=11;
    joint.den=0;
    joint.color=[1,0,0];
%% Target %%
    Target=[0,-20*D2R,-20*D2R,30*D2R,30*D2R,-40*D2R,-40*D2R];
    foot = arm3.height+foot_radius;
%% Model parameters
% Mechanical
density = 500;
foot_density = 1000;
if ~exist('actuatorType','var')
    actuatorType = 1;
end
world_damping = 1e-3;
world_rot_damping = 5e-2;
                    
% Contact/friction parameters
contact_stiffness = 500;
contact_damping = 50;
mu_k = 0.7;
mu_s = 0.9;
mu_vth = 0.01;
height_plane = 0.025;
plane_x = 25;
plane_y = 10;
contact_point_radius = 1e-4;

% Foot dimensions
foot_x = 5;
foot_y = 4;
foot_z = 1;
foot_offset = [-1 0 0];

% Leg dimensions
leg_radius = 0.75;
lower_leg_length = 10;
upper_leg_length = 10;

% Torso dimensions
torso_y = 8;
torso_x = 5;
torso_z = 8;
torso_offset_z = -2;
torso_offset_x = -1;
mass = (0.01^3)*torso_y*torso_x*torso_z*density;
g = 9.80665;      

% Joint parameters
joint_damping = 1;
joint_stiffness = 0;
motion_time_constant = 0.01;
joint_limit_stiffness = 1e4;
joint_limit_damping = 10;

%% Reinforcement Learning (RL) parameters
Ts = 0.025; % Agent sample time
Tf = 10;    % Simulation end time
        
% Scaling factor for RL action [-1 1]
max_torque = 18;

% Initial conditions
h = 15;     % Hip height [cm]
init_height = foot_radius+arm3.height - arm2.height/2 - body.height/2;
vx0 = 0;    % Initial X linear velocity [m/s]
vy0 = 0;    % Initial Y linear velocity [m/s]
wx0 = 0;    % Initial X angular velocity [rad/s]
wy0 = 0;    % Initial Y angular velocity [rad/s]
% Initial foot positions [m]
leftinit =  [0;0;-h/100];
rightinit = [0;0;-h/100];

% Calculate initial joint angles
init_angs_L = zeros(1,2);
theta = legInvKin(upper_leg_length/100,lower_leg_length/100,-leftinit(1),leftinit(3));
% Address multiple outputs
if size(theta,1) == 2
   if theta(1,2) < 0
      init_angs_L(1) = theta(2,1);
      init_angs_L(2) = theta(2,2);
   else
      init_angs_L(1) = theta(1,1);
      init_angs_L(2) = theta(1,2);
   end
end
init_angs_R = zeros(1,2);
theta = legInvKin(upper_leg_length/100,lower_leg_length/100,-rightinit(1),rightinit(3));
% Address multiple outputs
if size(theta,1) == 2
   if theta(1,2) < 0
      init_angs_R(1) = theta(2,1);
      init_angs_R(2) = theta(2,2);
   else
      init_angs_R(1) = theta(1,1);
      init_angs_R(2) = theta(1,2);
   end
end

