function [p1,p2]=pd(R,S,N,n1,n2)
r = min(n1,n2);
if n1<n2
    p1 = r*R +(N-1-r);
    p2 = r*R + S +(N-1-r);
elseif n1==n2
    p1 = r*R + (N-r);
    p2 = p1;
else
    p1 = r*R + S +(N-1-r);
    p2 = r*R +(N-1-r);
end
end
  