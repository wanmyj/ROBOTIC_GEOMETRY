function plane=ThreePoint2OnePlane(p1,p2,p3)
S12=p2-p1;
S13=p3-p1;
S=cross(S12,S13);%/norm(cross(S12,S13));
Do=-dot(p1,S);
plane=[Do,S];
