clc;clear all;close all;
a1=0;a2=225;a3=10;d1=327;d4=250;d6=64;
X=315;
Y=-16;
Z=420;
angleZ1=20;
angleX=30;
angleY=14;
R=RBR(angleZ1,angleX,angleY)
nx=R(1,1);ox=R(1,2);ax=R(1,3);
ny=R(2,1);oy=R(2,2);ay=R(2,3);
nz=R(3,1);oz=R(3,2);az=R(3,3);
t11=nx; t12=ox;t13=ax;
t21=ny; t22=oy;t23=ay;
t31=nz; t32=oz;t33=az;
xW=X-d6*t13;
yW=Y-d6*t23;
zW=Z-d6*t33;
if((sqrt(xW^2+yW^2)<300)&&(zW<=485))
    disp(' please put order coordinate');
else 
    %%theta1
    if((xW>0)&&(yW~=0))
        theta1=sign(yW)*(atan2(yW,xW));
    else if((xW==0)&&(yW~=0))
            theta=sign(yW)*pi/2;
        else if ((xW<0)&& (yW~=0))
                theta1=sign(yW)*(pi-atan(abs(yW/xW)));
            else ((xW~=0)&&(yW==0))
                theta1=pi-pi*sign(xW);
            end
        end
    end
    %%theta2
    r=sqrt(xW^2+yW^2);
    O1C=sqrt((r-a1)^2+(zW-d1)^2);
    O2C=sqrt(a3^2+d4^2);
    O1O2=a2;
if(O1C<O1O2+O2C)
    D=(O1O2^2+O1C^2-O2C^2)/(2*O1O2*O1C);
    E=(O1C^2-O1O2^2-O2C^2)/(2*O1O2*O2C);
    y2=zW-d1;
    x2=r-a1;
    if((x2>0)&&(y2~=0))
        theta21=sign(y2)*atan(abs(y2/x2));
    else if ((x2==0)&&(y2~=0))
            theta21=sign(y2)*pi/2;
        else if((x2<0)&&(y2~=0))
                theta21=sign(y2)*(pi-atan(abs(y2/x2)));
            else((x2~=0)&&(y2==0))
                theta21=pi-pi*sign(x2);
            end
        end
    end
    theta2=theta21+acos(D);
    %%theta3
    c=atan(d4/a3)
    theta3=atan(d4/a3)-atan((sqrt(1-E^2))/E)
    if(theta3>c)
        theta3=theta3-pi;
    end
    %%theta4
    r13=t33*sin(theta2 + theta3) + t13*cos(theta2 + theta3)*cos(theta1) + t23*cos(theta2 + theta3)*sin(theta1);
    r23=t13*sin(theta1) - t23*cos(theta1);
    r33=t13*sin(theta2 + theta3)*cos(theta1) - t33*cos(theta2 + theta3) + t23*sin(theta2 + theta3)*sin(theta1);
    r31=t11*sin(theta2 + theta3)*cos(theta1) - t31*cos(theta2 + theta3) + t21*sin(theta2 + theta3)*sin(theta1);
    r32=t12*sin(theta2 + theta3)*cos(theta1) - t32*cos(theta2 + theta3) + t22*sin(theta2 + theta3)*sin(theta1);
    %      theta4=atan(s23/s13);
    if ((r13>0)&&(r23~=0))
        theta4=sign(r23)*atan(abs(r23/r13));
    else if((r13==0)&&(r23~=0))
            theta4=sign(r23)*pi/2;
        else if((r13<0)&&(r23~=0))
                theta4=sign(r23)*(pi-atan(abs(r23/t13)));
            else ((r13~=0)&&(r23==0))
                theta4=pi-pi*sign(r13);
            end
        end
    end
    if(abs(t13)<=0.00001)&&(abs(t23)<=0.000001)
        theta4=0;
    end
    %theta5
    Ay=(r13+r23)/(cos(theta4)+sin(theta4));
    Ax=r33;
    if((Ax==0)&&(Ay~=0));
        theta5=atan(Ay/Ax);
    end
    if(Ax>0)
        theta5=atan(Ay/Ax);
    else if(Ax<0)
            if(Ay>=0);
                theta5=atan(Ay/Ax)+pi;
            else(Ay<=0)
                theta5=atan(Ay/Ax)+pi;
            end
        end
    end
    %theta6
    theta6=atan(r32/(-r31))
    if(r13==0)&&(r23==0)
        s21=sin(theta1)*t11-cos(theta1)*t21;
        s11=cos(theta1)*cos(theta2+theta3)*t11+sin(theta1)*cos(theta2+theta3)*t21+sin(theta2+theta3)*t31;
        theta5=0;  
        theta6=0;
        theta4=atan(s21/s11);
    end
    T1 = TransformMatrix(0,pi/2,d1,theta1)
    T2 = TransformMatrix(a2,0,0,theta2+pi/2)
    T3 = TransformMatrix(a3,pi/2,0,theta3)
    T4 = TransformMatrix(0,-pi/2,d4,theta4)
    T5 = TransformMatrix(0,pi/2,0,theta5)
    T6 = TransformMatrix(0,0,d6,theta6)



    T06 = T1*T2*T3*T4*T5*T6;

    theta1=theta1*180/pi;
    theta2=theta2*180/pi;
    theta3=theta3*180/pi;
    theta4=theta4*180/pi;
    theta5=theta5*180/pi;
    theta6=theta6*180/pi;
    [theta1;theta2;theta3;theta4;theta5;theta6]
    %test forwward again 
end

end

                
        

    
