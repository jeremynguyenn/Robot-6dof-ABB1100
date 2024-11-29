syms l1 l2 l3 l4 l5  theta1 theta2 theta3 theta4 theta5 theta6
T1 = [  cos(theta1)  0      sin(theta1)   0;
        sin(theta1)  0      -cos(theta1)  0;
        0        1      0         l1;
        0        0      0         1];
 
 
T2 = [-sin(theta2)         -cos(theta2)    0    -l2*sin(theta2);
     cos(theta2)          -sin(theta2)    0      l2*cos(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
T3 = [ cos(theta3)     0    sin(theta3)     l3*cos(theta3);
       sin(theta3)     0    -cos(theta3)    l3*sin(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
T4 = [ cos(theta4)   0     -sin(theta4)  0;
       sin(theta4)   0      cos(theta4)  0;
       0        -1      0        l4;
       0         0      0        1];
 
T5 = [ cos(theta5)   0        sin(theta5)   0;
       sin(theta5)   0        -cos(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
T6 = [ cos(theta6)     -sin(theta6)   0   0;
       sin(theta6)      cos(theta6)   0   0;
       0            0         1   l5;
       0            0         0   1];
 
T = T1*T2*T3*T4*T5*T6;

px = simplify(T(1,4))
py = T(2,4);
pz = T(3,4);

