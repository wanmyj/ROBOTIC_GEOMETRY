function line=LineByTwoPlanes(plane1,plane2)
S1=plane1(2:4);
Do1=plane1(1);
S2=plane2(2:4);
Do2=plane2(1);
line=[cross(S1,S2),Do1*S2-Do2*S1];