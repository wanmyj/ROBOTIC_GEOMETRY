function tfi=forward_PUMA2(a)
tf6=tab(0,0,0,0,0,1,a(1,4));
C=cell(5,1);
fprintf('\n\n');
for i=1:5
    C{i}=tij(a(i,1),a(i,2),a(i+1,3),a(i+1,4));%calculate each transform matrix
    fprintf('t%.0f%.0f=\n',i,i+1);
    disp(C{i});
    tf6=tf6*C{i};%multiple these transform matrixs togather
    fprintf('Transform Fix to %.0f=\n',i+1);
    disp(tf6);
    tfi{i}=tf6;%Transform Fix to i
end

