function f = drawq3()
%DRAWQ3 此处显示有关此函数的摘要
%   此处显示详细说明
    figure;
    hold on;
    control_points=[[-2,-10];[-4,2];[6,5];[4,-7]];
    h3_control_polygon=plot(control_points(:,1),control_points(:,2), 'g', 'linewidth', 2);
    h3_control_points=scatter(control_points(:,1),control_points(:,2),40, 'red', 'filled');

    relevant_points=[[-11/3,0];[1,7/2];[17/3,3];[-1/6,21/8];[13/6,27/8];[1,3]];
    h3_relevant_points=scatter(relevant_points(:,1),relevant_points(:,2),20, 'black', 'filled');
    h3_relevant_line1=plot(relevant_points(1:2,1),relevant_points(1:2,2), 'b', 'linewidth', 2)
    h3_relevant_line2=plot(relevant_points(2:3,1),relevant_points(2:3,2), 'b', 'linewidth', 2)
    h3_relevant_line3=plot(relevant_points(4:5,1),relevant_points(4:5,2), 'b', 'linewidth', 2)

    %B_spline_points

    t=0:0.001:1;
    bezier_control_points=[[-11/6,-11/2];[-8/3,-6];[-10/3,-2];[-2,1/2];[-2/3,3];[8/3,4];[4,5/2];[16/3,1];[14/3,-3];[10/3,-13/4]];
    %bezier_control_points=[[-2,-10];[-8/3,-6];[-10/3,-2];[-2,1/2];[-2/3,3];[8/3,4];[4,5/2];[16/3,1];[14/3,-3];[4,-7]];
    %bezier_control_points=[[-2,-8];[-8/3,-6];[-10/3,-2];[-2,1/2];[-2/3,3];[8/3,4];[4,5/2];[16/3,1];[14/3,-3];[13/3,-5]];
    %bezier_control_points=[[-11/6,-11/2];[-2,1/2];[4,5/2];[10/3,-13/4]];
    h3_bezier_control_points=scatter(bezier_control_points(:,1),bezier_control_points(:,2),20, 'magenta', 'filled');
    point_bezier1=bezier_caste(bezier_control_points(1:4,:),t);
    point_bezier2=bezier_caste(bezier_control_points(4:7,:),t);
    point_bezier3=bezier_caste(bezier_control_points(7:10,:),t);
    h3_bezier1=plot(real(point_bezier1),imag(point_bezier1),'r','linewidth', 2);
    h3_bezier2=plot(real(point_bezier2),imag(point_bezier2),'r','linewidth', 2);
    h3_bezier3=plot(real(point_bezier3),imag(point_bezier3),'r','linewidth', 2);

    
    f=true;
end

