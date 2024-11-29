clc; clear; close all;
syms l1 l2 l3 l4 l5 l6 t1 t2 t3 t4 t5 t6
l1 = 327;
l2 = 225;
l3 = 10;
l4 = 250;
l5 = 64;
t1 = pi/12;
t2 = pi/6;
t3 = pi/4;
t4 = pi/3;
t5 = pi/9;
t6 = pi/10;
T01 = TransformMatrix(0,pi/2,l1,t1);
T12 = TransformMatrix(l2,0,0,t2+pi/2);
T23 = TransformMatrix(l3,pi/2,0,t3);
T34 = TransformMatrix(0,-pi/2,l4,t4);
T45 = TransformMatrix(0,pi/2,0,t5);
T56 = TransformMatrix(0,0,l5,t6);

P6  = [0 0 0 1]';
T06 = T01*T12*T23*T34*T45*T56;
%T06 = simplify(T06)
P0 = T06*P6
