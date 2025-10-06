function QuaternionVisualization
% Quaternionic Storage Visualization (Manual Interactive Version)
% Demonstrates quaternion rotation storage using S^3 projection and 3D vector rotation.

close all; clc;

% Rotation axis (can be changed)
u = [1 1 1] / norm([1 1 1]);

% Angle range
theta = linspace(0, 4*pi, 200);

% Compute quaternions
q = [cos(theta/2)', sin(theta/2)'.*u(1), sin(theta/2)'.*u(2), sin(theta/2)'.*u(3)];

% Prepare figure
figure('Name','Quaternionic Storage Visualization','Color','w','Position',[100 100 1200 500]);

% Left: Quaternion projection (S^3 to 3D)
subplot(1,2,1);
hold on; grid on; axis equal;
xlabel('q_1'); ylabel('q_2'); zlabel('q_3');
title('Quaternion Storage (S^3 Projection)');
plot3(q(:,2), q(:,3), q(:,4), 'Color', [0.6 0.6 0.6]);
plot3(-q(:,2), -q(:,3), -q(:,4), ':', 'Color', [0.8 0.8 0.8]);

% Current quaternion marker and trace
hq = plot3(q(1,2), q(1,3), q(1,4), 'ko', 'MarkerFaceColor', 'k');
trace = plot3(q(1,2), q(1,3), q(1,4), 'b', 'LineWidth', 1.5);

% Right: Rotated vector visualization
subplot(1,2,2);
hold on; grid on; axis equal; view(30,20);
xlabel('x'); ylabel('y'); zlabel('z');
title('3D Vector Rotation');

v0 = [1 0 0]; % original vector
hv0 = quiver3(0,0,0,v0(1),v0(2),v0(3), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);
hv1 = quiver3(0,0,0,v0(1),v0(2),v0(3), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);

% Slider setup
slider = uicontrol('Style','slider','Min',0,'Max',4*pi,'Value',0,...
    'Units','normalized','Position',[0.3 0.02 0.4 0.05]);
addlistener(slider, 'Value', 'PostSet', @(src,evt) updatePlot(slider,q,u,v0,hq,trace,hv1,theta));

end

function updatePlot(slider,q,u,v0,hq,trace,hv1,theta)
val = get(slider,'Value');
[~, idx] = min(abs(theta - val));
qq = q(idx,:);

set(hq,'XData',qq(2),'YData',qq(3),'ZData',qq(4));
set(trace,'XData',q(1:idx,2),'YData',q(1:idx,3),'ZData',q(1:idx,4));

% Compute rotated vector
v = rotateVector(v0, qq);
set(hv1,'UData',v(1),'VData',v(2),'WData',v(3));
drawnow;
end

function v_rot = rotateVector(v, q)
qv = [0 v];
q_conj = [q(1) -q(2:4)];
v_rot_q = quatMultiply(quatMultiply(q, qv), q_conj);
v_rot = v_rot_q(2:4);
end

function q_out = quatMultiply(q1, q2)
w1=q1(1); x1=q1(2); y1=q1(3); z1=q1(4);
w2=q2(1); x2=q2(2); y2=q2(3); z2=q2(4);
q_out = [w1*w2 - x1*x2 - y1*y2 - z1*z2, ...
          w1*x2 + x1*w2 + y1*z2 - z1*y2, ...
          w1*y2 - x1*z2 + y1*w2 + z1*x2, ...
          w1*z2 + x1*y2 - y1*x2 + z1*w2];
end
