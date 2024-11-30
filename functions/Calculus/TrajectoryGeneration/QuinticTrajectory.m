
function [Q, dQ, ddQ] = QuinticTrajectory(q, T, n)
    
    timp=linspace(0,T,n);
    Q = zeros(3, n);
    dQ = zeros(3, n);
    ddQ = zeros(3, n);
    
    for i = 1:3
        % Matricea pentru coeficientii polinomului quintic
        A = [1, 0, 0, 0, 0, 0;
             0, 1, 0, 0, 0, 0;
             0, 0, 2, 0, 0, 0;
             1, T, T^2, T^3, T^4, T^5;
             0, 1, 2*T, 3*T^2, 4*T^3, 5*T^4;
             0, 0, 2, 6*T, 12*T^2, 20*T^3];
 	        
        b = [q(i, 1); 0; 0; q(i, 2); 0; 0];
        
        % Rezolvarea pentru coeficienti
        coeff = A \ b;
        coeff = flip(coeff);
        % Calcularea traiectoriei, vitezei și accelerației
        Q(i, :) = polyval(coeff, timp);
        dQ(i, :) = polyval(polyder(coeff), timp);
        ddQ(i, :) = polyval(polyder(polyder(coeff)), timp);
    end
end
