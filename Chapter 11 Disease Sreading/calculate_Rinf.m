function Rinf = calculate_Rinf(N,n,d,B,g)
infect = 0.01*N;
x=randi(n,1,N)-1;                       % Random Location along x
y=randi(n,1,N)-1;                       % Random Location along y
[~,I]=sort((x-n/2).^2+(y-n/2).^2);      % Find closest ones to the center
A=zeros(1,N);                       
A(I(1:infect))=1; I=logical(A);         % Infection status array
R=false(1,N);                           % Recovered status array
S=logical(1-I);                         % Susceptible status array
t=0;                                    % Time of the simulation 
while sum(I)*sum(S) > 0 
%% SIMULATION    
    dx=2*sign(randn(1,N)).*(rand(1,N)<d);     % Random Walks along x
    dy=2*sign(randn(1,N)).*(rand(1,N)<d);     % Random Walks along x
    x=mod(x+dx,n); y=mod(y+dy,n);             % Performing walks, Periodic Boundary Conditions, Alternative -solid walls- would be x(x>n)=n;
    for i=find(I)                           
        if rand<B
        infection=(x==x(i))&(y==y(i));      % Determine the indices for those who sit at the site of infection
        S(infection)=false;                 % There are no longer any susceptibles at infection area
        I(infection)=not(R(infection));     % All non-recovered agents will turn infected at infection site
        end
    end
    recovery=(rand(1,N)<g);         % Recovery array
    R = R | (I&recovery);           % Recovery operation
    I = I & not(recovery);          % The ones recovered are no longer infected 
t=t+1;
end
Rinf = sum(R+I);