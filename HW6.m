clear all
clc
%fprintf('\nplease input the paramaters A B D for equation in matrix form\n\n');
%fprintf('It should be a 1*3 matrix in form of [A B D] \n')
disp('this is for homework6.3')
fprintf('Press any key to continue\n\n')
pause
[a12, a23, a34, a41, theta1]=deal(75, 110, 60, 80, 120);
s41=sind(a41); c41=cosd(a41);
s23=sind(a23); c23=cosd(a23);
[s1, c1]=deal(sind(theta1),cosd(theta1));
[s12, c12]=deal(sind(a12),cosd(a12));
[s34, c34]=deal(sind(a34),cosd(a34));

x1=s41*s1;
y1=-(s12*c41+c12*s41*c1);
z1=c12*c41-s12*s41*c1;
A=s23*y1;
B=s23*x1;
D=c23*z1-c34;
theta2=dtrmnangEq(A, B, D);
[s2a,c2a,s2b,c2b]=deal(sind(theta2(2)),cosd(theta2(2)),sind(theta2(3)),cosd(theta2(3)));

%a
x2a=s12*s2a;
y2a=-(s23*c12+c23*s12*c2a);
s3a=(x1*c2a-y1*s2a)/s34;
c3a=(c23*(x1*s2a+y1*c2a)-s23*z1)/s34;
theta3a=dfangle(s3a,c3a);
z2a=c12*c23-s12*s23*c2a;
s4a=(x2a*c3a-y2a*s3a)/s41;
c4a=(c34*(x2a*s3a+y2a*c3a)-s34*z2a)/s41;
theta4a=dfangle(s4a,c4a);

%b
x2b=s12*s2b;
y2b=-(s23*c12+c23*s12*c2b);
s3b=(x1*c2b-y1*s2b)/s34;
c3b=(c23*(x1*s2b+y1*c2b)-s23*z1)/s34;
theta3b=dfangle(s3b,c3b);
z2b=c12*c23-s12*s23*c2b;
s4b=(x2b*c3b-y2b*s3b)/s41;
c4b=(c34*(x2b*s3b+y2b*c3b)-s34*z2b)/s41;
theta4b=dfangle(s4b,c4b);

fprintf('th2a=%.4f, th3a=%.4f, th4a=%.4f\n',theta2(2),theta3a,theta4a)
fprintf('th2b=%.4f, th3b=%.4f, th4b=%.4f\n',theta2(3),theta3b,theta4b)
