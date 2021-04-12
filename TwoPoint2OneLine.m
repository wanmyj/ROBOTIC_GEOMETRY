function line=TwoPoint2OneLine(p1,p2)
S=(p1-p2);%/norm(p2-p1);
Sol=cross(p1,S);
line=[S,Sol];