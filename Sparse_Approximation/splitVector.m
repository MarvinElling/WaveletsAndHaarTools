function vectors = splitVector(vector, steps)
    vectors = cell(steps+1, 1); % Preallocate cell array to store vectors
    for i = 1:steps
        half = ceil(length(vector)/2); % Find the midpoint
        vectors{i} = vector(half+1:end); % Store the second half
        vector = vector(1:half); % Update vector to the first half
    end
    vectors{steps+1} = vector; % Store the remaining vector
end
