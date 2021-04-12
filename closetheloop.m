function parameter=closetheloop(mat)
%please transfer the coord values to this function in matrix form
%It should be a 4*3 matrix of which 
%the first row is coord values of Point Tool in 6th reference frame
%the second row is coord values of Point Tool in fixed reference frame
%the third row is coord values of vector S6 in fixed reference frame
%the second row is coord values of vector a67 in fixed reference frame
%Press any key to continue


Ptool6=mat(1,:)';
Ptoolf=mat(2,:)';
fS6=mat(3,:)';
fa67=mat(4,:)';

fS7=cross(fa67,fS6);
fS1=[0;0;1];
fP6o=Ptoolf-dot(Ptool6,[1;0;0])*fa67- ...
    dot(Ptool6,[0;1;0])*cross(fS6,fa67)- ...
    dot(Ptool6,[0;0;1])*fS6;

c71=dot(fS7,fS1);
 
if (abs(c71))==1    %parallel 
    alpha71=0;
    S7=0;
    S1=-dot(fP6o,fS1);
    a71=norm(fP6o+S1*fS1);
    
    if a71~=0       %no-colinear
        fa71=-(fP6o+S1*fS1)/a71;
        
        %define theta7
        s7=dot(cross(fa67,fa71),fS7);   
        c7=dot(fa67,fa71);
        theta7=dfangle(s7,c7);    
    
    else            %colinear
        theta7=0;
        fa71=fa67;
    end
    
else                %no-parallel
    fa71=cross(fS7,fS1)/norm(cross(fS7,fS1));
    %define alpha71
    s71=dot(cross(fS7,fS1),fa71);
    alpha71=dfangle(s71,c71);
    
    %define theta7
    s7=dot(cross(fa67,fa71),fS7);
    c7=dot(fa67,fa71);
    theta7=dfangle(s7,c7);
    
    %define a71
    a71=dot(cross(fP6o,fS1),fS7)/s71;
    %define S1
    S1=dot(cross(fP6o,fS7),fa71)/s71;
    %define S7
    S7=dot(cross(fS1,fP6o),fa71)/s71;
end

%define gamma1
arccosgamma=dot(fa71,[1;0;0]);
arcsingamma=dot(cross(fa71,[1;0;0]),fS1);    
gamma1=dfangle(arcsingamma,arccosgamma);



parameter=[a71;S7;S1;alpha71;theta7;gamma1];

disp(' ');disp(' ')
disp(' ');disp(' ')
disp(' ');disp(' ')
disp(' ');disp(' ');disp(' ') 
disp(' ');
disp('input')
fprintf(' Ptool6=[%.0f %.0f %.0f]\n Ptoolf=[%.4f %.4f %.4f]\n fS6=[%.4f %.4f %.4f]\n fa67=[%.04f %.04f %.04f]\n',Ptool6, Ptoolf, fS6, fa67);
disp('output')
fprintf('a71=%.4f\nS7=%.4f\nS1=%.4f\nalpha71=%.4f\ntheta7=%.4f\ngamma1=%.4f\n',a71,S7,S1,alpha71,theta7,gamma1)
