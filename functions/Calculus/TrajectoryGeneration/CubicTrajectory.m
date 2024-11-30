
function [Q, dQ, ddQ] = CubicTrajectory(q, T, n)

    timp=linspace(0,T,n);
    Q = zeros(3, n);
    dQ = zeros(3, n);
    ddQ = zeros(3, n);
    
    for i = 1:3
        a0 = q(i, 1);
        a1 = 0;
        a2 = 3 * (q(i, 2) - q(i, 1)) / T^2;
        a3 = -2 * (q(i, 2) - q(i, 1)) / T^3;
        
        Q(i, :) = polyval([a3, a2, a1, a0], timp);
        dQ(i, :) = polyval(polyder([a3, a2, a1, a0]), timp);
        ddQ(i, :) = polyval(polyder(polyder([a3, a2, a1, a0])), timp);
    end
end
