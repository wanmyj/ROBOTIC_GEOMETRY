function line=TwoPlane2OneLine(plane1,plane2)

S1=plane1(2:4);
S2=plane2(2:4);
D1=plane1(1);
D2=plane2(1);
line=[cross(S1,S2),D1*S2-D2*S1];