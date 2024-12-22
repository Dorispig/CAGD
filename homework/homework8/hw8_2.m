function f = hw8_2()
%HW8_2 此处显示有关此函数的摘要
%   此处显示详细说明
    figure;
    [ellipsoid_,ellipsoid_dual]=ellipsoid(sqrt(3)/3,sqrt(2)/2,1);
    
    plot3(ellipsoid_(:,:,1),ellipsoid_(:,:,2),ellipsoid_(:,:,3),'r', 'linewidth', 1);
    hold on;
    plot3(-ellipsoid_(:,:,1),-ellipsoid_(:,:,2),-ellipsoid_(:,:,3),'r', 'linewidth', 1);
    hold on;
    plot3(ellipsoid_dual(:,:,1),ellipsoid_dual(:,:,2),ellipsoid_dual(:,:,3),'b', 'linewidth', 1);
    hold on;
    plot3(-ellipsoid_dual(:,:,1),-ellipsoid_dual(:,:,2),-ellipsoid_dual(:,:,3),'b', 'linewidth', 1);
    hold on;

    f=true;
end

