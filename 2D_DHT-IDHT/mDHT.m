function img_DHT = mDHT(img, J)
    % Perform 2 Dimensional DHT on img with step size J

    [m, n] = size(img);
    img_DHT = img;
    k = 0;
    L = length(img);

    while k < J
        % Apply 1D DHT along rows
        for i = 1:L
            row = img_DHT(i, 1:L);
            wRow = DHT(row, 1);
            img_DHT(i, 1:L) = wRow;
        end

        % Apply 1D DHT along columns
        for j = 1:L
            col = img_DHT(1:L, j)';
            wCol = DHT(col, 1);
            img_DHT(1:L, j) = wCol';
        end

        k = k + 1;
        L = (L / 2);
    end
end
