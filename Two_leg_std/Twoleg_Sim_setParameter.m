%2足歩行ロボットのmultibodyによるシミュレーション
%石井　馨
clear
%単位は[cm],[kg],[rad]で定義
D2R=pi/180;
R2D=180/pi;
alm_density=2.7E-3;%アルミニウムの密度[kg/cm^3]
%% body（上半身） %%
    body.length=25;
    body.width=40;
    body.height=30;
    body.dim=[body.length,body.width,body.height];
    body.mass=1;
    body.color=[1,1,1];
    body.den = 0;
%% thigh（大腿） %%
    thigh.length=8;
    thigh.width=10;
    thigh.height=40;
    thigh.dim=[thigh.length,thigh.width,thigh.height];
    thigh.mass=1;
    thigh.color=[1,0.6,0.2];
    thigh.den=0;
%% shin （脛）%%
    shin.length=8;
    shin.width=10;
    shin.height=35;
    shin.dim=[shin.length,shin.width,shin.height];
    shin.mass=1;
    shin.color=[0.5,1,0.5];
    shin.den=0;
%% foot（足） %%
    foot1.length=25;
    foot1.width=10;
    foot1.height=5;
    foot1.dim=[foot1.length,foot1.width,foot1.height];
    foot1.mass=1;
    foot1.color=[0.1,0.1,1];
    foot1.den=0;
    foot2.length=25;
    foot2.width=10;
    foot2.height=5;
    foot2.dim=[foot1.length,foot1.width,foot1.height];
    foot2.mass=1;
    foot2.color=[0.1,0.1,1];
    foot2.den=0;
%% joint %%
    joint.radius=4;
    joint.length=10.5;
    joint.den=0;
    joint.color=[1,0,0];
%% Target %%
    Target=[0,-20*D2R,-20*D2R,30*D2R,30*D2R,-40*D2R,-40*D2R];