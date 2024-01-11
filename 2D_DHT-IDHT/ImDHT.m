function img_ImDHT = ImDHT(img,J)
%IMDHT Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(img);
    img_DHT = img;
    k = 0;
    L = length(img)/(2^(J-1));

    while k < J

        % Apply 1D IDHT along columns
        for j = 1:L
            col = img_DHT(1:L, j)';
            wCol = IDHT(col, 1);
            img_DHT(1:L, j) = wCol';
        end

        % Apply 1D IDHT along rows
        for i = 1:L
            row = img_DHT(i, 1:L);
            wRow = IDHT(row, 1);
            img_DHT(i, 1:L) = wRow;
        end

        

        k = k + 1;
        L = L*2;
    end
    img_ImDHT = img_DHT;
end

