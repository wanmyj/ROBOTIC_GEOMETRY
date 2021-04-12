function t6f=t6f(a)
disp('a=');
disp(a);
t6f=eye(4);
C=cell(6,1);
for i=1:6
    C{i}=tij(a(i,1),a(i,2),a(i,3),a(i,4));
    fprintf('t%.0f%.0f=\n',i-1,i);
    disp(C{i});
    t6f=t6f*C{i};
end

	
