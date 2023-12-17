clear all;

linspaceN = 14;
x = linspace(0,1,2^linspaceN +1);
% f = 8 * x .*x .* (1-x);
% f = 1 - (2*x - 1).^10;
f = zeros(size(x));
f(x < 0.5) =sin(2*pi*x(x < 0.5));
f(x >= 0.5) = cos(2*pi*x(x >= 0.5));
N = 10;
J = 5;

[g,c0] = DyadicStep(linspaceN,N,f);
hs = HaarScalingFunctions(linspaceN,N);

current_c = c0; 
d_store = cell(1, J); % Stores d vectors
for j = 1:J 
    c_odd = current_c(1:2:end);
    c_even = current_c(2:2:end);
    current_c = 1/sqrt(2) * (c_odd + c_even); % calculate new c vector
    di = 1/sqrt(2) * (c_odd - c_even); % calculate new d vector
    d_store{j} = di; % store d vector
end
w = [current_c, d_store{end:-1:1}];

% Set smallest values to zero
NotZero = 64; % How many values should not be zero
w_mod = setSmallestToZero(w, 2^N-64);


c1_idht = IDHT(w_mod,N,J); % The reconstructed c vector

c0=c0*hs;
c1_idht = c1_idht*hs;
% Plotting
figure;
subplot(3,1,1);
plot(x, f);
title('Original Function')

subplot(3,1,2);
plot(linspace(0,1,length(c0)),c0);
title('c1');

subplot(3,1,3);
plot(linspace(0,1,length(c1_idht)),c1_idht);
title('c2 - Approximation');




