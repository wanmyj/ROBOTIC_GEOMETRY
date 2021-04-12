function point=IntersectionPointOfLineAndPlane(line,plane)
S1=line(1:3);
Sol=line(4:6);
Do=plane(1);
S2=plane(2:4);
point=[dot(S2,S1),cross(S2,Sol)-Do*S1];

