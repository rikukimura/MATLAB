clear
%単位は[cm],[kg],[rad]で定義
D2R=pi/180;
R2D=180/pi;
alm_density=2.7E-3;%アルミニウムの密度[kg/cm^3]
%% body %%
    body.length=80;
    body.width=30;
    body.height=10;
    body.dim=[body.length,body.width,body.height];
    body.mass=1;
    body.color=[1,1,1];
    body.den = 0;
%% arm1 %%
    arm1.length=10;
    arm1.width=10;
    arm1.height=15;
    arm1.dim=[arm1.length,arm1.width,arm1.height];
    arm1.mass=1;
    arm1.color=[1,0.6,0.2];
    arm1.den=0;
%% arm2 %%
    arm2.length=10;
    arm2.width=10;
    arm2.height=15;
    arm2.dim=[arm2.length,arm2.width,arm2.height];
    arm2.mass=1;
    arm2.color=[0.5,1,0.5];
    arm2.den=0;
%% arm3 %%
    arm3.length=10;
    arm3.width=10;
    arm3.height=15;
    arm3.dim=[arm3.length,arm3.width,arm3.height];
    arm3.mass=1;
    arm3.color=[0.1,0.1,1];
    arm3.den=0;
%% joint %%
    joint.radius=4;
    joint.length=11;
    joint.den=0;
    joint.color=[1,0,0];
%% Target %%
    Target=[0,-20*D2R,-20*D2R,30*D2R,30*D2R,-40*D2R,-40*D2R];