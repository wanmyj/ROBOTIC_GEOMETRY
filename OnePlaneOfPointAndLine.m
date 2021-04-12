function plane=OnePlaneOfPointAndLine(point,line)
S1=line(1:3);
Sol1=line(4:6);%/norm(line(1:3));
plane=[-dot(point,Sol1),Sol1-cross(point,S1)];