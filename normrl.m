function Nrmr=normrl(r,roworline)
%this func is used to normalize the lines or rows 
%of the matrix
if strcmp(roworline,'row')~=1&&strcmp(roworline,'line')~=1
    disp('plz input row or line')
    return
end
if strcmp(roworline,'row')==1
    r=r';
end
sr=r.*r;
s=(sum(sr)).^0.5;
[m,n]=size(r);
for j=1:n
    for i=1:m
        r(i,j)=r(i,j)/s(j);
    end
end
if strcmp(roworline,'row')==1
    r=r';
end
Nrmr=r;