function forwardPUMA(mat,n6Ptool,S6)

%fprintf('please input the values in matrix form \n\nPress any key to continue\n\n');
%pause;
a=[ 0  90 0 225; ...
    17 0 5.9 150; ...
    .8 270 0 -60; ...
    0  90 17 45; ...
    0  90 0 60; ...
    0  90 4 -30];%Parameters Table a(:,4)should be input

a(:,4)=mat;

a(6,3)=S6;%the length of S6

disp('Mechanism parameters for Puma robot')
fprintf('\n aij   Alphaij  Sj   Thetaj\n\n');
fprintf('%4.1f %8.3f %6.2f %6.2f\n',a');
tf6=forward_PUMA(a);%transform matrix from ref frame Fixed to 6
rf6=tf6(1:3,1:3);
fS6=rf6*[0;0;1];%vector S6 in ref frame Fixed
fa67=rf6*[1;0;0];%vector a67 in ref frame Fixed

disp(' ')
disp('input')
fprintf('phi1 =%.0f	th2 = %.0f 	th3 = %.0f\nth4 = %.0f	th5 = %.0f	th6 = %.0f  degrees\nPtool6 = %.0f, %.0f, %.0f  inches   S6 = %.0f inches\n\n',a(1,4),a(2,4),a(3,4),a(4,4),a(5,4),a(6,4),n6Ptool(1),n6Ptool(2),n6Ptool(3),a(6,3))
disp('output')
fPtool=tf6*[n6Ptool;1];
disp('Transform Fix to 6 =')
disp(tf6)
fprintf('         %.4f\nPtoolF=  %.4f  inches\n         %.4f\n         %.4f\n\n',fPtool')
fprintf('         %.4f\nS6vecF= %.4f  \n         %.4f\n\n',fS6')
fprintf('         %.4f\na67vecF= %.4f  \n        %.4f\n',fa67')

