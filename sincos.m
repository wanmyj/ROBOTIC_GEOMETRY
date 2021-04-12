function sincos=sincos(M)

n=length(M);
for i=1:1:n
    N(2*i-1:2*i)=[sind(M(i)),cosd(M(i))];
end
sincos=N;
