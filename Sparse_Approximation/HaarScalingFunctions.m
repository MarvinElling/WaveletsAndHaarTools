function p = HaarScalingFunctions(N,J)
% Determines the system of scale J Haar scaling functions
% N : Determines x-Achse the Interval [0,1] is dividet into 2^N+1 points

K = 2^J;                        % Anzahl der Funktionen
p = zeros(K,2^N+1);             % Speicher für die Funktionen
supLength = 2^(N-J);            % Support Länge jeder Funktion

p(1,1:supLength) = 2^(J/2);     % erste scale J Funktion
for k=2:K
   p(k,:) = circshift( p(k-1,:),supLength );     % shift of the previous function
end