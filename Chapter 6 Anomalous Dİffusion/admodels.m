%% SBM simulation
alpha = 1.5;
N = 10000;
x = zeros(1,N);
ksi = randn(1,N-1);
for i = 1:N-1
    x(i+1) = x(i) + ksi(i);
end
t = 
plot(x)

    