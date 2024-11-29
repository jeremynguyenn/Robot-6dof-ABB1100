function [R]=RPR(a,b,c)
R=[(cos(a)*cos(c)-sin(a)*cos(b)*sin(c))    (-cos(a)*sin(c)-sin(a)*cos(b)*cos(c))     (sin(a)*sin(b));
   (sin(a)*cos(c)+cos(a)*cos(b)*sin(c))    (-sin(a)*sin(c)+cos(a)*cos(b)*cos(c))     (-cos(a)*sin(b));
               (sin(b)*sin(c))                        (sin(b)*cos(c))                 cos(b)    ;];
end