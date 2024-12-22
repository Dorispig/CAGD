function f = drawq1()
%DRAWQ1 此处显示有关此函数的摘要
%   此处显示详细说明
    figure;
    hold on;
    t=0:0.001:1;
    points1=[[2,0];[0,2];[3,4];[4,1]];
    h1_q1_polygon = plot(points1(:,1),points1(:,2), 'g', 'linewidth', 2);
    h1_q1_points = scatter(points1(:,1),points1(:,2),30,'red','filled');

    points2=[[85/64,91/64];[15/8,19/8];[191/64,153/64]];
    h1_q2_points = scatter(points2(:,1),points2(:,2),30,'blue','filled');

    points3_control1=[[2,0];[1,1];[5/4,2];[15/8,19/8]];
    points3_control2=[[15/8,19/8];[35/16,41/16];[83/32,83/32];[191/64,153/64]];
    points3_control3=[[191/64,153/64];[27/8,35/16];[15/4,7/4];[4,1]];
    h1_q3_control1=scatter(points3_control1(:,1),points3_control1(:,2),20,'black','filled');
    h1_q3_control2=scatter(points3_control2(:,1),points3_control2(:,2),20,'black','filled');
    h1_q3_control3=scatter(points3_control3(:,1),points3_control3(:,2),20,'black','filled');

    h1_q3_polygon1=plot(points3_control1(:,1),points3_control1(:,2),'k', 'linewidth', 2);
    h1_q3_polygon2=plot(points3_control2(:,1),points3_control2(:,2),'k', 'linewidth', 2);
    h1_q3_polygon3=plot(points3_control3(:,1),points3_control3(:,2),'k', 'linewidth', 2);

    point3_bezier1=bezier_caste(points3_control1,t);
    point3_bezier2=bezier_caste(points3_control2,t);
    point3_bezier3=bezier_caste(points3_control3,t);
    h1_q3_bezier1=plot(real(point3_bezier1),imag(point3_bezier1),'r','linewidth', 2);
    h1_q3_bezier2=plot(real(point3_bezier2),imag(point3_bezier2),'r','linewidth', 2);
    h1_q3_bezier3=plot(real(point3_bezier3),imag(point3_bezier3),'r','linewidth', 2);

    f=true;
end

