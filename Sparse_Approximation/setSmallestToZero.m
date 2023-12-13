function modifiedVector = setSmallestToZero(inputVector, N)
    % Check if N is valid
    if N > numel(inputVector)
        error('N should be less than or equal to the number of entries in the vector.');
    end

    % Find the absolute values of the vector
    absVector = abs(inputVector);

    % Sort the absolute values and get the indices
    [~, sortedIndices] = sort(absVector);

    % Set the smallest N entries to zero
    inputVector(sortedIndices(1:N)) = 0;

    % The modified vector
    modifiedVector = inputVector;
end
