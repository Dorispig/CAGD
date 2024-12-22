function q = hw7_1(cc,d,w)
%HW7.1 第七次作业第一题，相机中心为(0,0,0)，平面为垂直于z轴的平面并面朝立方体
%   @param cc:center of cube.
%   @param d:half side length of cube.
%   @param w:the distance of the plane from the cc.
    p=[ [-d,-d,-d];
        [d,-d,-d];
        [d,d,-d];
        [-d,d,-d];
        [-d,-d,d];
        [d,-d,d];
        [d,d,d];
        [-d,d,d]];
    p_cube=p+cc;

    p_homo=homogenous_coord(p_cube);
    M=zeros(4,4);
    M(1,1)=w;
    M(2,2)=w;
    M(3,3)=w;
    M(4,3)=1;
    p_per=(M*p_homo')';
    p_per=p_per./p_per(:,4);
    q=p_per(:,1:2);
    % 定义立方体的面（每个面由4个顶点组成）
faces = [
    1, 4, 3, 2;   % 底面
    1, 2, 6, 5;   % 前面
    1, 5, 8, 4;   % 左面
    3, 4, 8, 7;    % 后面
    5, 6, 7, 8;   % 顶面
    2, 3, 7, 6;   % 右面
];

% 定义立方体的颜色（可选）
colors = [0.8, 0.8, 1; % 底面颜色
           1, 0.8, 0.8; % 前面颜色
           0.8, 1, 0.8; % 左面颜色
           1, 0.8, 0.8;  % 后面颜色
           0.8, 0.8, 1; % 顶面颜色
           0.8, 1, 0.8]; % 右面颜色

% 绘制立方体
figure;
hold on;
for i = 1:size(faces, 1)
    patch('Vertices', p_cube, 'Faces', faces(i, :), 'FaceColor', colors(i, :));
end
for i = 1:size(faces, 1)
    patch('Vertices', p_per(:,1:3), 'Faces', faces(i, :), 'FaceColor', colors(i, :));
end
plot3(0, 0, 0, 'kx', 'MarkerSize', 10, 'LineWidth', 2);
hold off;

% 设置视图
axis equal;
view(3);
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
zlim([0,cc(3)+d]);
title('hw7 problem1');

end

