
function [Q, dQ, ddQ] = QuinticTrajectory(jointLimits, T, samplingPoints)
    
    % Create a time vector for the trajectory
    time = linspace(0, T, samplingPoints);

    % Initialize matrices for position, velocity, and acceleration
    Q    = zeros(3, samplingPoints);
    dQ   = zeros(3, samplingPoints);
    ddQ  = zeros(3, samplingPoints);
    
    for i = 1:3
        % Equation system matrix for quintic polynomial (structure of the system)
        equationMatrix = [
                           1     0       0       0          0         0
                           0     1       0       0          0         0
                           0     0       2       0          0         0
                           1     T      T^2     T^3        T^4       T^5
                           0     1     2 * T   3 * T^2    4 * T^3   5 * T^4
                           0     0       2     6 * T     12 * T^2  20 * T^3
                          ];
        
        % Initial and final positions and velocities
        constraints = [jointLimits(i, 1); 0; 0; jointLimits(i, 2); 0; 0];
        
        % Solve for the quintic polynomial coefficients
        polynomial_coefficients = equationMatrix \ constraints;
        polynomial_coefficients = flip(polynomial_coefficients); % Reverse the order of the coefficients
        
        % Calculate the trajectory, velocity, and acceleration
          Q(i, :) = polyval(polynomial_coefficients, time);
         dQ(i, :) = polyval(polyder(polynomial_coefficients), time);
        ddQ(i, :) = polyval(polyder(polyder(polynomial_coefficients)), time);
    end

end
