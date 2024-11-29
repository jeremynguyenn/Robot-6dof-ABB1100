clc;clear all;close all;
a1=150;a2=575;a3=40;d1=544;d4=675;d7=90;
X=360;
Y=-150;
Z=369;
angleZ1=0;
angleX=0;
angleY=5;
R=RPR(angleZ1,angleX,angleY)
nx=R(1,1);sx=R(1,2);ax=R(1,3);
ny=R(2,1);sy=R(2,2);ay=R(2,3);
nz=R(3,1);sz=R(3,2);az=R(3,3);
t11=nx; t12=sx;t13=ax;
t21=ny; t22=sy;t23=ay;
t31=nz; t32=sz;t33=az;
xc=X-d7*t13;
yc=Y-d7*t23;
zc=Z-d7*t33;
if((sqrt(xc^2+yc^2)<300)&&(zc<=485))
    disp(' please put order coordinate');
else 
    %%theta1
    if((xc>0)&&(yc~=0))
        theta1=sign(yc)*(atan(abs(yc/xc)));
    else if((xc==0)&&(yc~=0))
            theta=sign(yc)*pi/2;
        else if ((xc<0)&& (yc~=0))
                theta1=sign(yc)*(pi-atan(abs(yc/xc)));
            else ((xc~=0)&&(yc==0))
                theta1=pi-pi*sign(xc);
            end
        end
    end
    %%theta2
    r=sqrt(xc^2+yc^2);
    O1C=sqrt((r-a1)^2+(zc-d1)^2);
    O2C=sqrt(a3^2+d4^2);
    O1O2=a2;
if(O1C<O1O2+O2C)
    D=(O1O2^2+O1C^2-O2C^2)/(2*O1O2*O1C);
    E=(O1C^2-O1O2^2-O2C^2)/(2*O1O2*O2C);
    y2=zc-d1;
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
    s13=t33*sin(theta2 + theta3) + t13*cos(theta2 + theta3)*cos(theta1) + t23*cos(theta2 + theta3)*sin(theta1);
    s23=t13*sin(theta1) - t23*cos(theta1);
    s33=t13*sin(theta2 + theta3)*cos(theta1) - t33*cos(theta2 + theta3) + t23*sin(theta2 + theta3)*sin(theta1);
    s31=t11*sin(theta2 + theta3)*cos(theta1) - t31*cos(theta2 + theta3) + t21*sin(theta2 + theta3)*sin(theta1);
    s32=t12*sin(theta2 + theta3)*cos(theta1) - t32*cos(theta2 + theta3) + t22*sin(theta2 + theta3)*sin(theta1);
    %      theta4=atan(s23/s13);
    if ((s13>0)&&(s23~=0))
        theta4=sign(s23)*atan(abs(s23/s13));
    else if((s13==0)&&(s23~=0))
            theta4=sign(s23)*pi/2;
        else if((s13<0)&&(s23~=0))
                theta4=sign(s23)*(pi-atan(abs(s23/t13)));
            else ((s13~=0)&&(s23==0))
                theta4=pi-pi*sign(s13);
            end
        end
    end
    if(abs(t13)<=0.00001)&&(abs(t23)<=0.000001)
        theta4=0;
    end
    %theta5
    Ay=(s13+s23)/(cos(theta4)+sin(theta4));
    Ax=s33;
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
    theta6=atan(s32/(-s31))
    if(s13==0)&&(s23==0)
        s21=sin(theta1)*t11-cos(theta1)*t21;
        s11=cos(theta1)*cos(theta2+theta3)*t11+sin(theta1)*cos(theta2+theta3)*t21+sin(theta2+theta3)*t31;
        theta5=0;  
        theta6=0;
        theta4=atan(s21/s11);
    end
T01=TransformMatrix(a1,pi/2,d1,theta1);
T12=TransformMatrix(a2,0,0,theta2);
T23=TransformMatrix(a3,pi/2,0,theta3);
T34=TransformMatrix(0,-pi/2,d4,theta4);
T45=TransformMatrix(0,pi/2,0,theta5);
T56=TransformMatrix(0,0,0,theta6);
T67=TransformMatrix(0,0,d7,0);
T07=T01*T12*T23*T34*T45*T56*T67
    theta1=theta1*180/pi;
    theta2=theta2*180/pi;
    theta3=theta3*180/pi;
    theta4=theta4*180/pi;
    theta5=theta5*180/pi;
    theta6=theta6*180/pi;
    [theta1;theta2;theta3;theta4;theta5;theta6]
    %test forwward again 
    px=T07(1,4)
    py=T07(2,4)
    pz=T07(3,4)
end

end