function tij=tij(aij, Alphaij, Sj, Thetaj)
%Sj is the distance betweenvectors aij & ajk
%value a23 is the distance between the vectors S2 & S4
%cj & sj represent the sine and cosine of Thetaj
%sij and cij represent the sine and cosine of Alpha12
cij=cosd(Alphaij);
sij=sind(Alphaij);
cj=cosd(Thetaj);
sj=sind(Thetaj);
tij=[cj    -sj     0    aij; ...
    sj*cij cj*cij  -sij -sij*Sj; ...
    sj*sij cj*sij  cij  cij*Sj; ...
    0      0       0    1];