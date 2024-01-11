function img_DHT = mDHT(img)
    % Perform 2 Dimensional DHT on img with step size J

    [m, n] = size(img);
    img_DHT = img;
    L = length(img);

    % Apply 1D DHT along rows
    for i = 1:L
        row = img_DHT(i, 1:L);
        wRow = DHT(row, 1);
        img_DHT(i, 1:L) = wRow;
    end

end

