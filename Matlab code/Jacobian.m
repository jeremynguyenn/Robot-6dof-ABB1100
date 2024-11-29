clc; clear;close all
syms l1 l2 l3 l4 l5 l6 t1 t2 t3 t4 t5 t6 real
l1 = 327;
l2 = 225;
l3 = 10;
l4 = 250;
l5 = 64;
t1 = pi/12;  %15 degree
t2 = pi/6;   %30 degree
t3 = pi/4;   %45 degree
t4 = -pi/12; %-15 degree
t5 = -pi/6;  %-30 degree
t6 = -pi/4;  %-45 degree
td1 = 0.5    % rad/s
td2 = 1      % rad/s
td3 = 1.5    % rad/s
td4 = 0.5    % rad/s
td5 = 1      % rad/s
td6 = 1.5    % rad/s
theta_dot = [td1 td2 td3 td4 td5 td6]'

T01 = TransformMatrix(0,pi/2,l1,t1)
T12 = TransformMatrix(l2,0,0,t2+pi/2)
% T12= simplify(T12)
T23 = TransformMatrix(l3,pi/2,0,t3)
% T23= simplify(T23)
T34 = TransformMatrix(0,-pi/2,l4,t4)
% T34= simplify(T34)
T45 = TransformMatrix(0,pi/2,0,t5)
% T45= simplify(T45)
T56 = TransformMatrix(0,0,l5,t6)
% T56= simplify(T56)

T02= T01*T12;
%  T02= simplify(T02)

T03= T01*T12*T23;
% T03= simplify(T03)

T04= T01*T12*T23*T34;
% T04= simplify(T04)

T05= T01*T12*T23*T34*T45;
% T05= simplify(T05)

T06= T01*T12*T23*T34*T45*T56;
% T06= simplify(T06)

z0 = [0 0 1 0]';
Z0 = transZ(z0);

z1 = T01*[0 0 1 0]'
Z1 = transZ(z1);

z2 = T02*[0 0 1 0]'
Z2 = transZ(z2);

z3 =T03*[0 0 1 0]'
Z3 = transZ(z3);

z4 = T04*[0 0 1 0]'
Z4 = transZ(z4);

z5 = T05*[0 0 1 0]'
Z5 = transZ(z5);

z6 = T06*[0 0 1 0]'
Z6 = transZ(z6);

P0 = [0 0 0 ]';
P1 = T01*[0 0 0 1]';
P1 = [P1(1),P1(2),P1(3)]'
P2 = T02*[0 0 0 1]';
P2 = [P2(1),P2(2),P2(3)]'
P3 = T03*[0 0 0 1]';
P3 = [P3(1),P3(2),P3(3)]'
P4 = T04*[0 0 0 1]';
P4 = [P4(1),P4(2),P4(3)]'
P5 = T05*[0 0 0 1]';
P5 = [P5(1),P5(2),P5(3)]'
Pe = T06*[0 0 0 1]';
Pe = [Pe(1),Pe(2),Pe(3)]'
Jv1 = [Z0*(Pe-P0)]
%Jv1 = simplify(Jv1);
Jw1 = z0
Jv2 = [Z1*(Pe-P1)]
%Jv2 = simplify(Jv2);
Jw2 = z1
Jv3 = [Z2*(Pe-P2)]
%Jv3 = simplify(Jv3);
Jw3 = z2
Jv4 = [Z3*(Pe-P3)]
%Jv4 = simplify(Jv4);
Jw4 = z3
Jv5 = [Z4*(Pe-P4)]
%Jv5 = simplify(Jv5);
Jw5 = z4 
Jv6 = [Z5*(Pe-P5)]
%Jv6 = simplify(Jv6);
Jw6 = z5
J   = [ Jv1 Jv2 Jv3 Jv4 Jv5 Jv6 
        Jw1 Jw2 Jw3 Jw4 Jw5 Jw6 ]
%J = simplify(J)
v  = J*theta_dot
v1 = Jv1*td1
w1 = Jw1*td1
v2 = Jv2*td2
w2 = Jw2*td2
v3 = Jv3*td3
w3 = Jw3*td3
v4 = Jv4*td4
w4 = Jw4*td4
v5 = Jv5*td5
w5 = Jw5*td5
v6 = Jv6*td6
w6 = Jw6*td6
