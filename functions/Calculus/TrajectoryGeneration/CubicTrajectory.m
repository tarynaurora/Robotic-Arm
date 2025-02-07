
function [Q, dQ, ddQ] = CubicTrajectory(jointLimits, totalTime, samplingPoints)

    time = linspace(0,totalTime,samplingPoints);

    Q    = zeros(3, samplingPoints);
    dQ   = zeros(3, samplingPoints);
    ddQ  = zeros(3, samplingPoints);
    
    for i = 1:3
        a0 = jointLimits(i, 1);
        a1 = 0;
        a2 =  3 * (jointLimits(i, 2) - jointLimits(i, 1)) / totalTime^2;
        a3 = -2 * (jointLimits(i, 2) - jointLimits(i, 1)) / totalTime^3;
        
         Q(i, :) = polyval([a3, a2, a1, a0], time);
        dQ(i, :) = polyval(polyder([a3, a2, a1, a0]), time);
       ddQ(i, :) = polyval(polyder(polyder([a3, a2, a1, a0])), time);
    end

end
