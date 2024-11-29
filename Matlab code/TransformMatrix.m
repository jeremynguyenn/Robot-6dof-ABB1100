function T = TransformMatrix(a, alpha, d, theta)
%overcome error cos(pi/2) = 6.12e-17
if(alpha==pi/2)||(alpha==-pi/2)
    c_alpha = round(cos(alpha));
else
    c_alpha = cos(alpha);
end
if(theta==pi/2)||(theta==-pi/2)
    c_theta = round(cos(theta));
else
    c_theta = cos(theta);
end
% overcome error sin(pi) = 1.2246e-16
if(alpha==pi/2)||(alpha==-pi/2)
    s_alpha = round(sin(alpha));
else
    s_alpha = sin(alpha);
end
if(theta==pi/2)||(theta==-pi/2)
    s_theta = round(sin(theta));
else
    s_theta = sin(theta);
end
%-------------------------------
T = [c_theta   -s_theta*c_alpha     s_theta*s_alpha      a*c_theta
    s_theta    c_theta*c_alpha      -c_theta*s_alpha     a*s_theta
    0          s_alpha              c_alpha              d
    0          0                    0                    1]
end