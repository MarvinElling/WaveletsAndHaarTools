function [p,c0] = DyadicStep(N,J,f)
    % Approx with Diadic Step function
    hs = HaarScalingFunctions(N,J);

    % Approximation by Haar Scaling Functions
    c0 = zeros(1,2^J);
    for n=1:2^J
        c0(n) = ScalarProd(N,f,hs(n,:));
    end
    p = c0*hs;
end

