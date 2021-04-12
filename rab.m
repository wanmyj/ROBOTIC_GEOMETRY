function r=rab(mx,my,mz,theta)
x=mx/((mx^2+my^2+mz^2))^0.5;
y=my/((mx^2+my^2+mz^2))^0.5;
z=mz/((mx^2+my^2+mz^2))^0.5;
c=cosd(theta);
v=1-c;
s=sind(theta);

r=[x*x*v+c x*y*v-z*s, x*z*v+y*s; ...
    x*y*v+z*s y*y*v+c y*z*v-x*s; ...
    x*z*v-y*s y*z*v+x*s z*z*v+c];