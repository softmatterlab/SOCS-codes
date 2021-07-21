N = 200;
x = ones(N,1)*(1:N);
y = (1:N)'*ones(1,N);

I = zeros(N,N);


    

for i = 1:200
    xc = rand*N;
    yc = rand*N;
    d = 10*rand^-.5;
    S = rand^-.5;
    I = I+S*exp(-((y-yc).^2+(x-xc).^2)/d^2);
end
I1 = I;
I = zeros(N,N);
for i = 1:200
    xc = rand*N;
    yc = rand*N;
    d = 10*rand^-.5;
    S = rand^-.5;
    I = I+S*exp(-((y-yc).^2+(x-xc).^2)/d^2);
end


%%

I = zeros(100,200,200);
Rd = rand(1,200);
Rs = rand(1,200); 
Rx = rand(1,200);
Ry = rand(1,200);
for t= 1:100
    Rd = mod(Rd + randn(1,N)*0.01,1);
    Rs = mod(Rs + randn(1,N)*0.01,1);
    Rx = mod(Rx + randn(1,N)*0.01,1);
    Ry = mod(Ry + randn(1,N)*0.01,1);
    It = zeros(N,N);
    for i=1:N
        xc = Rx(i)*N;
        yc = Ry(i)*N;
        d = 10*Rd(i)^-.5;
        S = Rs(i)^-.1;
        It = It+S*exp(-((y-yc).^2+(x-xc).^2)/d^2);
    end
    I(t,:,:) = It;
    disp(t);
end
        
%%
for t = 1:100
    imagesc(reshape(I(t,:,:),[N,N]));
    drawnow();
    pause(0.05);
end

        
    