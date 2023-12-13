function c1 = IDHT(w,N,J)
% Performing IDHT
    w_split = splitVector(w,J);
    c_working = w_split{J+1};
    for j = J:-1:1
        c_odd = (w_split{j} + c_working);
        c_even = (c_working - w_split{j});

        c_working = zeros(1,2*numel(c_even));
        c_working(1:2:end) = c_odd;
        c_working(2:2:end) = c_even;
        c_working = c_working * sqrt(2)/2;

    end
    
    c1 = c_working;

end

