
function [velocities] = DirectKinematics(Q, dQ, time)

numSteps   = length(Q(1, :));
velocities = zeros(6, numSteps);

for i=1:numSteps

    q1=Q(1,i);
    q2=Q(2,i);
    q3=Q(3,i);
    
    dq1=dQ(1,i);
    dq2=dQ(2,i);
    dq3=dQ(3,i);
    
    Jacobain = [
                            0                                -2 * sin(q2)                0    ;...
        2 * sin(q2) * cos(q1) - q3 * sin(q1) - 2 * cos(q1)    2 * sin(q1) * cos(q2)    cos(q1);...
        q3 * cos(q1) - 2 * sin(q1) + 2 * sin(q1) * sin(q2)   -2 * cos(q1) * cos(q2)    sin(q1);...
                            1                                      0                     0    ;...
                            0                                     cos(q1)                0    ;...
                            0                                     sin(q1)                0    ;
               ];

    velocities(:, i) = Jacobain  * [dq1; dq2; dq3];

end

% Define colors
pastelPurple = [0.75, 0.65, 0.85]; 
pastelBlue   = [0.4, 0.6, 1];   
pastelRed    = [0.85, 0.65, 0.75];    
 
% Create a figure with subplot for linear and angular velocities
figure;

% Linear velocities subplot
subplot(2, 1, 1); % 2 rows, 1 column, first subplot
hold on;
grid on;
plot(time, velocities(1,:), 'Color', pastelPurple, 'LineWidth', 2);
plot(time, velocities(2,:), 'Color', pastelBlue,   'LineWidth', 2);
plot(time, velocities(3,:), 'Color', pastelRed,    'LineWidth', 2);

% Add labels, title, and legend
xlabel('Time [s]', 'FontSize', 10);
ylabel('Linear Velocities', 'FontSize', 10);
title('Linear Velocities Over Time', 'FontSize', 10, 'FontName', 'Arial', 'FontWeight', 'light');
legend('v_{1}', 'v_{2}', 'v_{3}', 'Location', 'best');

% Angular velocities subplot
subplot(2, 1, 2); % 2 rows, 1 column, second subplot
hold on;
grid on;
plot(time, velocities(4,:), 'Color', pastelPurple, 'LineWidth', 2);
plot(time, velocities(5,:), 'Color', pastelBlue, 'LineWidth', 2);
plot(time, velocities(6,:), 'Color', pastelRed, 'LineWidth', 2);

% Add labels, title, and legend
xlabel('Time [s]', 'FontSize', 10);
ylabel('Angular Velocities', 'FontSize', 10);
title('Angular Velocities Over Time', 'FontSize', 10, 'FontName', 'Arial', 'FontWeight', 'light');
legend('\omega_{1}', '\omega_{2}', '\omega_{3}', 'Location', 'best');

% Adjust figure layout for better spacing
sgtitle('Velocities Analysis', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Arial'); % Main title

end

