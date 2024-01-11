function compressedCoefficients = compDHT(coefficients, p)
    % COMPDHT: Compress the DHT coefficients by keeping only the largest p%.
    %   coefficients: DHT coefficients to be compressed.
    %   p: Percentage of coefficients to keep.

    % Get the absolute values of the coefficients
    absCoefficients = abs(coefficients);

    % Find the threshold value for the top p% of coefficients
    threshold = prctile(absCoefficients(:), 100 - p);

    % Set coefficients below the threshold to zero
    compressedCoefficients = coefficients .* (absCoefficients >= threshold);
end
