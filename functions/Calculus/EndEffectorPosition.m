
function [pGripper, arm1, arm2, arm3] = EndEffectorPosition(theta1, theta2, d)

% Homogeneous Transformation Matrices
% Rotation about the X-axis: 
T1_0 =  [1      0            0      0;
         0 cos(theta1) -sin(theta1) 0;
         0 sin(theta1)  cos(theta1) 0;
         0      0            0      1];

% Rotation about the Y-axis:
T2_1 =  [cos(theta2) 0 sin(theta2) -2;
             0       1      0       0;
        -sin(theta2) 0 cos(theta2)  2;
             0       0      0       1];

% Translation about the Y-axis:
T3_2 =  [1 0 0 0; 
         0 1 0 d;
         0 0 1 0;
         0 0 0 1];

% Transformation for the end effector
% Positions the end effector 2 units along the X-axis.
Te_3 = [ 1 0 0 2;
         0 1 0 0; 
         0 0 1 0;
         0 0 0 1];

% Joint Orientation in Reference Frame
T2_0 = T1_0 * T2_1; % Base frame to joint 2 transformation.
T3_0 = T2_0 * T3_2; % Base frame to joint 3 transformation.
Te_0 = T3_0 * Te_3; % Base frame to end effector transformation.

% Extraction of the positions of the arm segments
arm1 = [T1_0(1:3, 4), T2_0(1:3, 4)];
arm2 = [T2_0(1:3, 4), T3_0(1:3, 4)];
arm3 = [T3_0(1:3, 4), Te_0(1:3, 4)];

% Final position of the end effector in global coordinates
pGripper = Te_0(1:3, 4);

end


