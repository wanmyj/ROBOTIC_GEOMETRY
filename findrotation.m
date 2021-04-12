function rotation=findrotation(r)

cos=(r(1,1)+r(2,2)+r(3,3)-1)/2;
theta=acosd(cos);
if theta>5
    fprintf('it is a big angle theta=%f \n',theta);
    sin=sind(thet                                                                                                                                                                                                         a);
    mz=(r(2,1)-r(1,2))/2/sin;
    my=(r(1,3)-r(3,1))/2/sin;
    mx=(r(3,2)-r(2,3))/2/sin;
    
else
    fprintf('it ts a small angle theta=%f \n',theta);
    mx=sign(r(2,1)-r(1,2))*sqrt((r(1,1)-cos)/(1-cos));
    my=sign(r(1,3)-r(3,1))*sqrt((r(2,2)-cos)/(1-cos));
    mz=sign(r(3,2)-r(3,2))*sqrt((r(3,3)-cos)/(1-cos));
    m=[mx my mz]; %??mx my mz???
    n=sort(m);
    max=find(m>=n(3));
    syms x y z
    switch(max)
        case 1
            my=vpa(solve((r(1,2)+r(2,1))/(mx*my*(1-cos))-2,my),4);
            mz=vpa(solve((r(1,3)+r(3,1))/(mx*mz*(1-cos))-2,mz),4);
        case 2            
            mx=vpa(solve((r(1,2)+r(2,1))/(x*my*(1-cos))-2,x),4);
            mz=vpa(solve((r(2,3)+r(3,2))/(z*my*(1-cos))-2,z),4);
        case 3
            mx=vpa(solve((r(1,3)+r(3,1))/(x*mz*(1-cos))-2,x),4);
            my=vpa(solve((r(2,3)+r(3,2))/(mz*y*(1-cos))-2,y),4);
    end
end

rotation=[mx;my;mz;theta];
