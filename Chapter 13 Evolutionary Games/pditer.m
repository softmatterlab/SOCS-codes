function Sup = pditer(S,R,s,N,L,mu)
P = zeros(L,L);
pind = circshift(1:L,-1);
mind = circshift(1:L, 1);
for i=1:L
    for j=1:L
        [p1, p2] = pd(R,s,N,S(i,j),S(pind(i),j));
        P(i,j) = P(i,j) + p1;
        P(pind(i),j) = P(pind(i),j) + p2;

        [p1, p2] = pd(R,s,N,S(i,j),S(i,pind(j)));
        P(i,j) = P(i,j) + p1;
        P(i,pind(j)) = P(i,pind(j)) + p2;
    end
end
for i=1:L
    for j=1:L
       if rand < mu
           S(i,j)=round(rand)*N;
       else
           A = min([P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
           SS = [S(i,j) S(i,mind(j)) S(i,pind(j))  S(mind(i),j) S(pind(i),j)];
           if sum(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)])>1
               Sup(i,j) = SS(randsample(find(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]),1));
           else
               Sup(i,j) = SS(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
           end

       end
    end
end

