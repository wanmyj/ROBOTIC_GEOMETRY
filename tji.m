function tji=tji(Thetaj, aij, Alphaij, Sj)
cj=cosd(Thetaj);
cj=sind(Thetaj);
cij=cosd(Alphaij);
sij=sind(Alphaij);

tji=[ cj  sj*cij sj*sij -cj*aij...
      -sj cj*cij cj*sij sj*aij ...
      0   -sij   cij    -Sj ...
      0   0      0      1];