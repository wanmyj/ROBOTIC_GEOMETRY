clear 
clc
dbstop if error
warning off all
fprintf('This code is solving for HW9, PUMA\n\n')
fprintf('Press any key to continue\n\n')
pause

%determine a71;S7;S1;alpha71;theta7;gamma1
mat(1:4,1:3)=[5 3 7;24.112 20.113 18.167;0.079 -0.787 0.612;0.997 0.064 -0.047];
parameters=closetheloop(mat);
parameters=num2cell(parameters);
[a71,S7,S1,alpha71,theta7,gamma1]=deal(parameters{:});

%define s12, c12, s23, c23, s34, c34, s45, c45, s56, c56, s67, c67, s71, c71, s7, c7
ag=[90 0 270 90 90 90 alpha71 theta7];
ag=sincos(ag);
ag=num2cell(ag);
[s12, c12, s23, c23, s34, c34, s45, c45, s56, c56, s67, c67, s71, c71, s7, c7]=deal(ag{:});

%define other parameters
[a12, a23, a34, a45, a56, a67]=deal(0,17,0.8,0,0,0);
[S2,S3,S4,S5,S6]=deal(5.9,0,17,0,4);

%determine X7 Y7 Z7
XYZ5=XYZ(90,alpha71,theta7,0);
XYZ5=num2cell(XYZ5);
[X7,Y7,Z7]=deal(XYZ5{:});

%determine theta1
theta1=dtrmnangEq(S6*Y7-S7*s71,S6*X7+a71,S2);
phi1=theta1-gamma1;

%determine X71 Y71 Z71
c1=cosd(theta1);s1=sind(theta1);
Z71=(X7.*s1+Y7.*c1)*s12+c12*Z7;
Y71=(X7.*s1+Y7.*c1)*c12-s12*Z7;
X71=X7.*c1-Y7.*s1;

%determine X1 Y1 Z1
XYZ1=XYZ(alpha71,90,theta1,0);
X1=XYZ1(1,:);
Y1=XYZ1(2,:);
Z1=XYZ1(3,:);

%determine theta3
A=-S6*X71-S7*X1-a71*c1;
B=S1-S6*Y71-S7*Y1;
theta3a=dtrmnangEq(2*a23*a34,-2*a23*S4,a23^2+a34^2+S4^2-A(1)^2-B(1)^2);
theta3b=dtrmnangEq(2*a23*a34,-2*a23*S4,a23^2+a34^2+S4^2-A(2)^2-B(2)^2);
theta3=[theta3a,theta3b];

%determine c3 s3
c3=cosd(theta3);
s3=sind(theta3);

%determine theta2
for i=1:length(theta3)
    [c2,s2]=solve('(a23+a34*c3(i)-S4*s3(i))*c2+(-a34*s3(i)-S4*c3(i))*s2-A(round(i/2))',...
        '(-a34*s3(i)-S4*c3(i))*c2+(-a23-a34*c3(i)+S4*s3(i))*s2-B(round(i/2))','c2','s2');
    c2=eval(subs(c2));s2=eval(subs(s2));
    theta2(i)=dfangle(s2,c2);
end

%determine c2 s2
s2=sind(theta2);c2=cosd(theta2);

%determine Z7123
Z71=[Z71(1) Z71(1) Z71(2) Z71(2)];
Y71=[Y71(1) Y71(1) Y71(2) Y71(2)];
X71=[X71(1) X71(1) X71(2) X71(2)];
Z712=s23*(X71.*s2+Y71.*c2)+c23*(Z71);
Y712=c23*(X71.*s2+Y71.*c2)-s23*(Z71);
X712=X71.*c2-Y71.*s2;
Z7123=s34*(X712.*s3+Y712.*c3)+c34*Z712;
X7123=X712.*c3-Y712.*s3;
Y7123=c34*(X712.*s3+Y712.*c3)-s34*Z712;


%determine theta5
theta5=acosd(-Z7123);
theta5=kron(theta5,[1, -1]);

%determine c5 s5
c5=cosd(theta5);s5=sind(theta5);

%determine theta4
X7123=kron(X7123,[1,1]);
Y7123=kron(Y7123,[1,1]);
c4=X7123./s5;
s4=-Y7123./s5;
for i=1:8
    theta4(i)=dfangle(s4(i),c4(i));
end

%determine theta6
XYZ4=XYZ(270,90,theta4,1);
X4b=XYZ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      );
Z4b=XYZ4(3,:);

s3=kron(s3,[1,1]);
c3=kron(c3,[1,1]);
Y43=(X4b.*s3+Y4b.*c3)*c23-s23*Z4b;
X43=X4b.*c3-Y4b.*s3;
Z43=(X4b.*s3+Y4b.*c3)*s23+c23*Z4b;

s2=kron(s2,[1,1]);
c2=kron(c2,[1,1]);
Y432=(X43.*s2+Y43.*c2)*c12-s12*Z43;
X432=X43.*c2-Y43.*s2;
Z432=(X43.*s2+Y43.*c2)*s12+c12*Z43;

s1=kron(s1,[1,1,1,1]);
c1=kron(c1,[1,1,1,1]);
Y4321=(X432.*s1+Y432.*c1)*c71-s71*Z432;
X4321=X432.*c1-Y432.*s1;
Z4321=(X432.*s1+Y432.*c1)*s71+c71*Z432;

c7=c7*ones(1,8);
s7=s7*ones(1,8);
X43217=X4321.*c7-Y4321.*s7;
Y43217=c67*(X4321.*s7+Y4321.*c7)-s67*Z4321;

s6=X43217;
c6=Y43217;
for i=1:8
    theta6(i)=dfangle(s6(i),c6(i));
end

%make phi1 theta2 theta3 to be 1X8 mats
theta1=reshape(repmat(theta1,4,1),1,8);
phi1=reshape(repmat(phi1,4,1),1,8);
theta2=reshape(repmat(theta2,2,1),1,8);
theta3=reshape(repmat(theta3,2,1),1,8);
disp(' ');disp(' ')
disp('   phi1       theta2  theta3     theta4    theta5    theta6')
disp([phi1' theta2' theta3' theta4' theta5' theta6'])
mata=[ phi1; theta2; theta3; theta4; theta5; theta6];
n6Ptool=[5 3 7];
S6l=4;
for i=1:8
    fprintf('\nsulotion%.0f\n',i)
    forwardPUMA(mata(:,i),n6Ptool',S6l);
end