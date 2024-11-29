clc; clear; close all;
a1=0;a2=225;a3=10;d1=327;d4=250;d6=64;
%X,Y,Z input 
X=124;
Y=-95;
Z=481;
angleZ4=0;
angleZ5=0;
angleZ6=0;
R=RPR(angleZ4,angleZ5,angleZ6);
nx=R(1,1);
ox=R(1,2);
ax=R(1,3);
ny=R(2,1);
oy=R(2,2);
ay=R(2,3);
nz=R(3,1);
oz=R(3,2);
az=R(3,3);
xW=X-(d6*(ax));
yW=Y-(d6*(ay));
zW=Z-(d6*(az));
%%theta1
theta1=atan2(yW,xW)    
  
   
%%theta2
r=sqrt(xW^2+yW^2);
O1M=r;
O1W=sqrt(r^2+(zW-327)^2);
O2W=sqrt(a3^2+d4^2);
O1O2=a2;
WM= zW-327;
alpha=(O1O2^2+O1W^2-O2W^2)/(2*O1O2*O1W);
delta=(O1W^2-WM^2+r^2)/(2*r*O1W);
O2O1W=atan2(+-sqrt(abs(1-alpha^2)),alpha);
WO1M=atan2(+-sqrt(abs(1-delta^2)),delta);
theta2=abs(O2O1W+WO1M)-pi/2
%%theta3
beta=-((-225)^2+O2W^2-O1W^2)/(2*O2W*225);
gamma=+-sqrt((1-beta^2));
X3O2W=atan2(gamma,beta);
theta3=atan2(d4,a3)-abs(X3O2W)
%%theta4
R03= [-sin(theta2 + theta3)*cos(theta1)    sin(theta1)      cos(theta2 + theta3)*cos(theta1); 
      -sin(theta2 + theta3)*sin(theta1)    -cos(theta1)     cos(theta2 + theta3)*sin(theta1); 
       cos(theta2 + theta3)                0                sin(theta2 + theta3)];
R30=inv(R03);  
R36=R30*R;
r11=R03(1,1);
r13=R36(1,3);
r12=R36(1,2);
r23=R36(2,3);
r22=R36(2,2);
r21=R36(2,1);
r33=R36(3,3);
r31=R36(3,1);
r32=R36(3,2);
theta4=atan2(r23,r12)
    
%theta5, theta6
    

theta5=atan2(+-sqrt(1-r33^2),r33)
if (theta5<-2.181661565),(theta5>2.181661565)
    theta5=abs(theta5)-pi/2
end    
theta6=atan2(-r32,r31) 
   
    T1 = [  cos(theta1)  0      sin(theta1)   0;
        sin(theta1)  0      -cos(theta1)  0;
        0        1      0         d1;
        0        0      0         1];
 
 
    T2 = [-sin(theta2)         -cos(theta2)    0    -a2*sin(theta2);
     cos(theta2)          -sin(theta2)    0      a2*cos(theta2);
      0                0           1    0;
      0                0           0    1];
 
 
    T3 = [ cos(theta3)     0    sin(theta3)     a3*cos(theta3);
       sin(theta3)     0    -cos(theta3)    a3*sin(theta3);
       0           1    0           0;
       0           0    0           1];
 
 
    T4 = [ cos(theta4)   0     -sin(theta4)  0;
       sin(theta4)   0      cos(theta4)  0;
       0        -1      0        d4;
       0         0      0        1];
 
    T5 = [ cos(theta5)   0        sin(theta5)   0;
       sin(theta5)   0        -cos(theta5)  0;
       0         1        0         0;
       0         0        0         1];
 
 
    T6 = [ cos(theta6)     -sin(theta6)   0   0;
       sin(theta6)      cos(theta6)   0   0;
       0            0         1   d6;
       0            0         0   1];

    theta1=theta1*180/pi;
    theta2=theta2*180/pi;
    theta3=theta3*180/pi;
    theta4=theta4*180/pi;
    theta5=theta5*180/pi;
    theta6=theta6*180/pi; 
  

    T06 = T1*T2*T3*T4*T5*T6;
   
    [theta1;theta2;theta3;theta4;theta5;theta6]
    %test forwward again 
    pX = (T06(1,4))
    pY = (T06(2,4))
    pZ = (T06(3,4))



                
        

    
