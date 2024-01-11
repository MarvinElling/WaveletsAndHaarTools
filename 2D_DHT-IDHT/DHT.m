function w = DHT(v,steps)
% Determines the discrete Haar Transform of the vector v
% J ist die minimale Approximationsgrad

% Lend = 2^J;
step = 0;
w = zeros(1,0);

c = v;
L = length(c);
% while L>Lend
while step < steps
    h1 = c(1:2:L);   h2 = c(2:2:L);
    c = (h1 + h2)/sqrt(2);     % Approximation coefficients
    d = (h1 - h2)/sqrt(2);     % Detail coefficients
    w = [d , w];
    L = L/2;
    step = step+1;
end

w = [c,w];
