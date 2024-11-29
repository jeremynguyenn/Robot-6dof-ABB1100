clc; clear;
l1=327;
l2=225;
l3=10;
l4=250;
l6=64;
for t1=-1.2777777778*pi:1:1.2777777778*pi
    for t2=-0.63888888889*pi:1:0.62777777778*pi
        for t3=-1.1388888889*pi:1:0.30555555556*pi
            for t4=-1.2777777778*pi:1:1.2777777778*pi
                for t5=-0.69444444444*pi:1:0.66666666667*pi
                    for t6=-2.2222222222*pi:1:2.2222222222*pi
                        px=l4*cos(t1)*cos(t2)*cos(t3) - l2*cos(t1)*sin(t2) - l3*cos(t1)*cos(t2)*sin(t3) - l3*cos(t1)*cos(t3)*sin(t2) - l4*cos(t1)*sin(t2)*sin(t3) + l6*sin(t1)*sin(t4)*sin(t5) + l6*cos(t1)*cos(t2)*cos(t3)*cos(t5) - l6*cos(t1)*cos(t5)*sin(t2)*sin(t3) - l6*cos(t1)*cos(t2)*cos(t4)*sin(t3)*sin(t5) - l6*cos(t1)*cos(t3)*cos(t4)*sin(t2)*sin(t5);
                        py=l4*cos(t2)*cos(t3)*sin(t1) - l2*sin(t1)*sin(t2) - l3*cos(t2)*sin(t1)*sin(t3) - l3*cos(t3)*sin(t1)*sin(t2) - l6*cos(t1)*sin(t4)*sin(t5) - l4*sin(t1)*sin(t2)*sin(t3) + l6*cos(t2)*cos(t3)*cos(t5)*sin(t1) - l6*cos(t5)*sin(t1)*sin(t2)*sin(t3) - l6*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) - l6*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5);
                        pz=l1 + l2*cos(t2) + l3*cos(t2)*cos(t3) + l4*cos(t2)*sin(t3) + l4*cos(t3)*sin(t2) - l3*sin(t2)*sin(t3) + l6*cos(t2)*cos(t5)*sin(t3) + l6*cos(t3)*cos(t5)*sin(t2) + l6*cos(t2)*cos(t3)*cos(t4)*sin(t5) - l6*cos(t4)*sin(t2)*sin(t3)*sin(t5);
                        plot3(px,py,pz,'*')
                        hold on
                    end
                end
            end
        end
    end
end   