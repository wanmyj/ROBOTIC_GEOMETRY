function mutualmoment=mutualmoment(line1,line2)
S1=line1(1:3);
S2=line2(1:3);
Sol1=line1(4:6);
Sol2=line2(4:6);
mutualmoment=(dot(S1,Sol2)+dot(S2,Sol1))/norm(S1)/norm(S2);
