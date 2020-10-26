% function [A,B,C,D] = getLinearModelForABS(slope,Vs,Ww)
% x1 = Tb; % brake torque
% x2 = Td; % derivative of x1
% x3 = Vs; % vechile angular speed
% x4 = Ww; % wheel angular speed
% v0 = 25; % vechile speed when braking starts

% initialization
load modelData;
x3 = v0;
x4 = v0;
slope = -0.4;
Ts = 0.002;
A = zeros(4,4);
B = zeros(4,1);
C = zeros(1,4);
D = 0;

% updates matrices
A(1,2) = 1;
A(2,2) = -1/TB;
A(3,3) = -x4/x3^2*g/4/Rr*slope;
A(3,4) = 1/x3*g/4/Rr*slope;
A(4,1) = -1/I;
A(4,3) = -x4/x3^2*m*g*Rr/4*slope;
A(4,4) = 1/x3*m*g*Rr/4*slope;
B(2) = Kf/TB;
C(3) = 1;
C(4) = -1;

% plant model (convert to linear speed by factor Rr)
plant = Rr*ss(A,B,C,D);

% mpc design
mpc1 = mpc(minreal(plant),Ts);
mpc1.MV.ScaleFactor = 30;







