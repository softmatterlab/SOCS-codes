% HW 2 Forest Fires


N=64;
T=false(N,N);
p=0.005;
f=1;
NF=;
NN=100;
n=1;
S=zeros(1,NN);
x=randi(N,1,NN); y=randi(N,1,NN);
while NF<NN
    T=T|(rand(N,N)<p);
    if rand<f
       C=bwlabel(T,4);
       if T(x(NF),y(NF))~= 0
       T(C==C(x(NF),y(NF)))=false;
       S(n)=sum(sum(C==C(x(NF),y(NF)))); 
       n=n+1
       end
      NF=NF+1;
    end 
    
    clf; imagesc(T); 
    axis('equal');
    drawnow();
end
