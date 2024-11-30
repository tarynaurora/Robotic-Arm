
function plotKinematics(thetaStart, thetaStop, timeSpan)

% Generate 100 sample points between time 0 and the specified time span
timeSamples = linspace(0, timeSpan, 100); 

% Interpolation of angles between start and end values
Q1 = linspace(thetaStart(1), thetaStop(1), length(timeSamples));  % Angle Q1
Q2 = linspace(thetaStart(2), thetaStop(2), length(timeSamples));  % Angle Q2
Q3 = linspace(thetaStart(3), thetaStop(3), length(timeSamples));  % Translation Q3

% Initialize matrix to hold end-effector positions
endEffectorPositions = zeros(3, length(timeSamples));             

figure;
% Generate data for animation
    for i = 1:length(timeSamples)

        % Calculate position based on interpolated angles
        [pGripper, arm1, arm2, arm3] = EndEffectorPosition(Q1(i), Q2(i), Q3(i)); 
        endEffectorPositions(:,i) = pGripper;  % Use interpolated angles
        clf;

        % Call the plotting function for the robotic arm
        plotSystem(arm1, arm2, arm3);

        
        xlabel 'x'
        ylabel 'y'
        zlabel 'z'
        axis([-6, 6, -6, 6, -6, 6])
        view(10, 10);

        drawnow;
    end

    figure;
    % Draw the final trajectory
    plot3(endEffectorPositions(1,:), endEffectorPositions(2,:), endEffectorPositions(3,:), 'LineStyle', '-.', 'Color', [0.75, 0.65, 0.85]);
   
end