function plength = pathlength(A)
t = 1;
M = A;
plength = zeros(length(A),length(A));
for i = 1:length(A)
    plength(i,i)=1;
end
while sum(sum(plength==0))>0
    plength( (M>0) &  (plength==0) ) = t;
    M = sign(M*A);
    t = t + 1;
    if t>100
        plength(plength==0)=NaN;
        break
    end
end
for i = 1:length(A)
    plength(i,i)=mean(plength(i,[1:i-1 i+1:end]));
end
