function PointOnPerpLineOfTwoline=PointOnPerpLineOfTwoline(line1,line2)

S1=line1(1:3);
S2=line2(1:3);
Sol1=line1(4:6);
Sol2=line2(4:6);
va12=normrl(cross(S1,S2),'row');
sina12=dot(cross(S1,S2),va12);
cosa12=dot(S1,S2);
alpha12=dfangle(sina12,cosa12);
a12=-(dot(S1,Sol2)+dot(S2,Sol1))/sina12;
PointOnPerpLineOfTwoline=cross(Sol1,Sol2-a12*cross(va12,S2))/dot(Sol1,S2);
line=[va12,cross(PointOnPerpLineOfTwoline,va12)];
AnotherPointOnPerpLineOfTwoline=PointOnPerpLineOfTwoline+a12*va12;