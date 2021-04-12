%this function is used to calculate the angle by determined sine and cosine
%values of that angle
%answer is of degree unit
function theta=dfangle(sintheta,costheta)
sa=asind(sintheta);
ca=acosd(costheta);
if sintheta >0 && costheta < 0
    theta=ca;
elseif sintheta >0 && costheta >0
    theta=ca;
elseif sintheta <0 && costheta >0    
    theta=sa;
else 
    theta=-(180+sa);
end

