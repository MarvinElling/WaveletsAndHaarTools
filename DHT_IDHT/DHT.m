clear all;

linspaceN = 14;
x = linspace(0,1,2^linspaceN +1);
f = 8 * x .*x .* (1-x);

N = 10;
J = 7;

[g,c0] = DyadicStep(linspaceN,N,f);

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

c1_idht = IDHT(w,N,J); % The reconstructed c vector

% Show that IDHT worked

if isequal(round(c1_idht,14), round(c0,14))
    disp('c0 and c1 from IDHT are the same.')
else
    disp('They are different.')
    a = c0-c1_idft;
    disp(a(1:5));

end



% Plotting
figure;
% subplot(3,1,1);
% plot(x, g);
% 
% subplot(3,1,2)
% plot(linspace(0,1,length(c1_idht)),HaarScalingFunctions(linspaceN,N)*c1_idht);

%subplot(3,1,3)
abs_w = abs(w);
loglog(abs_w);
xlim([10^0 10^3]);
ylim([10^(-7) 10^0]);


