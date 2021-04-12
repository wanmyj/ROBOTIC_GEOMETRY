function dtrmnangEq=dtrmnangEq(A,B,D)

%This function is used to determine the angle values of equations in form
%of Acos(x)+Bsin(x)+D=0

ganma=dfangle(B/norm([A,B]),A/norm([A,B]));
i=-D/norm([A,B]);
if abs(i)>=1
    r=0;
    angA='NA';
    angB='NA';
    if i==1
        angA=gamma;
        angB=gamma;
    end
    if i==(-1)
        angA=gamma+180;
        angB=gamma+180;
    end
else
    r=1;
    angA=ganma+acosd(i);
    angB=ganma-acosd(i);
end
    %dtrmnangEq=[angA,angB,r];
    dtrmnangEq=[angA,angB];