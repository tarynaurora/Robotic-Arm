
function trajectoryPlanner(jointLimits, totalTime, samplingPoints)
    
% Generate a time vector for the trajectory
time = linspace(0, totalTime, samplingPoints);

% Calculate the trajectory using cubic and quintic polynomial methods:
[  cubic_Q,   cubic_dQ,   cubic_ddQ] = CubicTrajectory  (jointLimits, totalTime, samplingPoints);
[quintic_Q, quintic_dQ, quintic_ddQ] = QuinticTrajectory(jointLimits, totalTime, samplingPoints);

% Animation parameters
n = length(time); % number of points
speed = 0.0001;   % animation speed control (lower for slower animation)
figure;

    for i = 1:3
    clf;

% Subplot for position
    subplot(3, 1, 1);
    title(['Joint ', num2str(i), ' - Position']);
    xlabel('Time (s)');
    ylabel('Position');
    hold on;
    grid on;
    axis tight;
    xlim([min(time), max(time)]);
    ylim([min([cubic_Q(i,:), quintic_Q(i,:)]), max([cubic_Q(i,:), quintic_Q(i,:)])]);

% Animation for Cubic and Quintic trajectory
        for j = 1:n
            plot(time(1:j), cubic_Q(i, 1:j),   'LineWidth', 2, 'Color', [0.75, 0.65, 0.85]); 
            plot(time(1:j), quintic_Q(i, 1:j), 'LineWidth', 2, 'Color', [0.4, 0.6, 1]);
            drawnow;
            pause(speed);
        end

    legend('Cubic', 'Quintic');
    hold off;

% Subplot for velocity
    subplot(3, 1, 2);
    title(['Joint ', num2str(i), ' - Velocity']);
    xlabel('Time (s)');
    ylabel('Velocity');
    hold on;
    grid on;
    axis tight;
    xlim([min(time), max(time)]);
    ylim([min([cubic_dQ(i,:), quintic_dQ(i,:)]), max([cubic_dQ(i,:), quintic_dQ(i,:)])]);

% Animation for Cubic and Quintic trajectory
        for j = 1:n
            plot(time(1:j),   cubic_dQ(i, 1:j), 'LineWidth', 2, 'Color', [0.75, 0.65, 0.85]);
            plot(time(1:j), quintic_dQ(i, 1:j), 'LineWidth', 2, 'Color', [0.4, 0.6, 1]); 
            drawnow;
            pause(speed);
        end

    legend('Cubic', 'Quintic');
    hold off;

% Subplot for acceleration
    subplot(3, 1, 3);
    title(['Joint ', num2str(i), ' - Acceleration']);
    xlabel('Time (s)');
    ylabel('Acceleration');
    hold on;
    grid on;
    axis tight;
    xlim([min(time), max(time)]);
    ylim([min([cubic_ddQ(i,:), quintic_ddQ(i,:)]), max([cubic_ddQ(i,:), quintic_ddQ(i,:)])]);

% Animation for Cubic and Quintic trajectory
        for j = 1:n
             plot(time(1:j),   cubic_ddQ(i, 1:j), 'LineWidth', 2, 'Color', [0.75, 0.65, 0.85]);
             plot(time(1:j), quintic_ddQ(i, 1:j), 'LineWidth', 2, 'Color', [0.4, 0.6, 1]); 
             drawnow;
             pause(speed);
        end

    legend('Cubic', 'Quintic');
    hold off;
    end

end
