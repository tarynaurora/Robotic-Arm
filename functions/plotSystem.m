
function plotSystem(arm1, arm2, arm3)

% This function creates a new figure for the robotic arm visualization

%_______________________________Settings_________________________________

figure;
hold on;
grid on; 
set(gca, 'Color', 'k'); % Set background color to black
set(gca, 'GridColor', [0.85, 0.80, 0.90], 'GridAlpha', 0.5); 

% Define marker properties for joints
markerProps.MarkerSize = 10;
markerProps.MarkerFaceColor = 'y';
markerProps.MarkerEdgeColor = 'k';
markerProps.LineWidth = 1.60;

% Define color for axis labels
labelColor = [0.60, 0.50, 0.70];

% Axis
xlabel('X-axis', 'Color', labelColor); 
ylabel('Y-axis', 'Color', labelColor); 
zlabel('Z-axis', 'Color', labelColor); 

% Set equal axis scaling and define axis limits
axis equal;
axis([-3, 3, -3, 3, -3, 3]); 

% Title
title('3D Visualization of Robotic Arm', 'Color', [0.60, 0.50, 0.70]); 

% Base of the robotic arm 
plot3([0, 0], [0, 0], [0, -1.5], 'LineWidth', 8, 'Color', [0.75, 0.65, 0.85]); 


%_______________________First Arm_______________________________
 
plot3(arm1(1,:), arm1(2,:), arm1(3,:), ...
    'LineWidth', 3, 'Color', [0.75, 0.65, 0.85]); 

% Marker for the first joint
plot3(arm1(1,1), arm1(2,1), arm1(3,1), 'o', ...
    'MarkerSize', markerProps.MarkerSize, ...
    'MarkerFaceColor', markerProps.MarkerFaceColor, ...
    'MarkerEdgeColor', markerProps.MarkerEdgeColor, ...
    'LineWidth', markerProps.LineWidth); 

% Marker for the end of the arm
plot3(arm1(1,2), arm1(2,2), arm1(3,2), 'o', ...
    'MarkerSize', markerProps.MarkerSize, ...
    'MarkerFaceColor', markerProps.MarkerFaceColor, ...
    'MarkerEdgeColor', markerProps.MarkerEdgeColor, ...
    'LineWidth', markerProps.LineWidth); 
%_______________________________________________________________


%_______________________Secomd Arm______________________________

plot3(arm2(1,:), arm2(2,:), arm2(3,:), ...
    'LineWidth', 3, 'Color', [0.75, 0.65, 0.85]);

% Marker for the end of arm
plot3(arm2(1,2), arm2(2,2), arm2(3,2), 's', ...
    'MarkerSize', 11 , ...
    'MarkerFaceColor', markerProps.MarkerFaceColor, ...
    'MarkerEdgeColor', markerProps.MarkerEdgeColor, ...
    'LineWidth', 2); 
%_______________________________________________________________


%_______________________Third Arm_______________________________

plot3(arm3(1,:), arm3(2,:), arm3(3,:), ...
    'LineWidth', 1, 'Color', [0.9, 0.8, 0.9], 'LineStyle', '--');

% Marker for the end of arm
plot3(arm3(1,2), arm3(2,2), arm3(3,2), 'd', ...
    'MarkerSize', markerProps.MarkerSize, ...
    'MarkerFaceColor', markerProps.MarkerFaceColor, ...
    'MarkerEdgeColor', markerProps.MarkerEdgeColor, ...
    'LineWidth', markerProps.LineWidth); 
%_______________________________________________________________

hold off; % Release the hold on the figure

end
