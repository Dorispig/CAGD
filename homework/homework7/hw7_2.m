function [ellipse,hyperbola] = hw7_2(ellipse_a,ellipse_b,hyperbola_a,hyperbola_b)
%HW7_2 用有理Bezier样条曲线拟合椭圆和双曲线
%   @param ellipse_a:椭圆半长轴
%   @param ellipse_a:椭圆半短轴
%   @param hyperbola_a:双曲线半长轴
%   @param hyperbola_b:双曲线半短轴
%   @return ellipse:椭圆点(逆时针)
%   @return hyperbola:双曲线点()
    t=0:0.001:1;
    ellipse_c=sqrt(ellipse_a^2-ellipse_b^2);
    ellipse_w=[1,sqrt(2)/2,1];
    %ellipse_w=[1,ellipse_c/ellipse_a,1];
    ellipse_p1=[[ellipse_a,0];[ellipse_a,ellipse_b];[0,ellipse_b]];
    ellipse1_3d=Rational_Bezier_Spline(ellipse_p1,ellipse_w,t);
    ellipse1_2d=ellipse1_3d(:,:)./ellipse1_3d(:,3);

    ellipse_w_=[1,-ellipse_w(2),1];
    ellipse1_3d_=Rational_Bezier_Spline(ellipse_p1,ellipse_w_,t);
    ellipse1_2d_=ellipse1_3d_(:,:)./ellipse1_3d_(:,3);
%{
    ellipse_p2=[[0,ellipse_b];[-ellipse_a,ellipse_b];[-ellipse_a,0]];
    ellipse2=Rational_Bezier_Spline(ellipse_p2,ellipse_w,t);
    ellipse2=ellipse2(:,1:2)./ellipse2(:,3);

    ellipse_p3=[[-ellipse_a,0];[-ellipse_a,-ellipse_b];[0,-ellipse_b]];
    ellipse3=Rational_Bezier_Spline(ellipse_p3,ellipse_w,t);
    ellipse3=ellipse3(:,1:2)./ellipse3(:,3);

    ellipse_p4=[[0,-ellipse_b];[ellipse_a,-ellipse_b];[ellipse_a,0]];
    ellipse4=Rational_Bezier_Spline(ellipse_p4,ellipse_w,t);
    ellipse4=ellipse4(:,1:2)./ellipse4(:,3);
    ellipse=[ellipse1;ellipse2;ellipse3;ellipse4];
%}
    ellipse_=[ellipse1_3d;ellipse1_3d_];
    figure;
    h_ellipse1_2d=plot3(ellipse1_2d(:,1),ellipse1_2d(:,2),ellipse1_2d(:,3)*1, 'r', 'linewidth', 2);
    hold on;
    h_ellipse1_2d_=plot3(ellipse1_2d_(:,1),ellipse1_2d_(:,2),ellipse1_2d_(:,3)*1, 'g', 'linewidth', 2);
    hold on;
    h_ellipse1_3d=plot3(ellipse1_3d(:,1),ellipse1_3d(:,2),ellipse1_3d(:,3), 'b', 'linewidth', 2);
    hold on;
    h_ellipse1_3d_=plot3(ellipse1_3d_(:,1),ellipse1_3d_(:,2),ellipse1_3d_(:,3), 'k', 'linewidth', 2);

    legend('ellipse2d','ellipse2d_{dual}','ellipse3d','ellipse3d_{dual}');
    axis equal;
view(3);
grid on;
xlabel('X');xlim([-ellipse_a,ellipse_a]);
ylabel('Y');ylim([-ellipse_b,ellipse_b]);
zlabel('Z');zlim([0,max(ellipse1_3d(:,3))]);

title('hw7 problem2 ellipse');

    hyperbola_c=sqrt(hyperbola_a^2+hyperbola_b^2);
    hyperbola_w=[1,hyperbola_c/hyperbola_a,1];
    hyperbola_p1=[[hyperbola_c,-hyperbola_b^2/hyperbola_a];[hyperbola_a^2/hyperbola_c,0];[hyperbola_c,hyperbola_b^2/hyperbola_a]];
    hyperbola1_3d=Rational_Bezier_Spline(hyperbola_p1,hyperbola_w,t);
    hyperbola1_2d=hyperbola1_3d(:,:)./hyperbola1_3d(:,3);

    hyperbola_w_=[1,-hyperbola_w(2),1];
    hyperbola1_3d_=Rational_Bezier_Spline(hyperbola_p1,hyperbola_w_,t);
    hyperbola1_2d_=hyperbola1_3d_(:,:)./hyperbola1_3d_(:,3);

    hyperbola=[hyperbola1_3d;hyperbola1_3d_];
    figure;
    %h_ellipse=plot(ellipse(:,1),ellipse(:,2), 'r', 'linewidth', 2);
    h_hyperbola1_2d=plot3(hyperbola1_2d(:,1),hyperbola1_2d(:,2),hyperbola1_2d(:,3)*1, 'r', 'linewidth', 2);
    hold on;
    h_hyperbola1_2d_=plot3(hyperbola1_2d_(:,1),hyperbola1_2d_(:,2),hyperbola1_2d_(:,3)*1, 'g', 'linewidth', 2);
    hold on;
    h_hyperbola1_3d=plot3(hyperbola1_3d(:,1),hyperbola1_3d(:,2),hyperbola1_3d(:,3), 'b', 'linewidth', 2);
    hold on;
    h_hyperbola1_3d_=plot3(hyperbola1_3d_(:,1),hyperbola1_3d_(:,2),hyperbola1_3d_(:,3), 'k', 'linewidth', 2);

    legend('hyperbola2d','hyperbola2d_{dual}','hyperbola3d','hyperbola3d_{dual}');
    axis equal;
view(3);
grid on;
xlabel('X');xlim([-hyperbola_a,hyperbola_a]);
ylabel('Y');ylim([-hyperbola_b,hyperbola_b]);
zlabel('Z');zlim([0,max(hyperbola1_3d(:,3))]);
title('hw7 problem2 hyperbola');

end

