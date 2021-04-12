clear 
clc
fprintf('please input the coord values in matrix form\n\n');
fprintf('It should be a 4*3 matrix of which \nthe first row is coord values of Point Tool in 6th reference frame\n')
fprintf('the second row is coord values of Point Tool in fixed reference frame\n')
fprintf('the third row is coord values of vector S6 in fixed reference frame\n')
fprintf('the fourth row is coord values of vector a67 in fixed reference frame\n')
fprintf('Press any key to continue\n\n')
pause
mat(1:4,1:3)=input('[(Ptool6) x y z;\n (Ptoolf) x y z; \n (fS6)    x y z;\n (fa67)   x y z]=');
closetheloop(mat);
