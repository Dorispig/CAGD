function f = hw8_1()
%HW8_1 此处显示有关此函数的摘要
%   此处显示详细说明
    figure;
    sphere(100);
    hold on;
    %[X,Y,Z]=sphere(100);
    [cir,cir_dual]=ellipsoid(1,1,1);
    %plot3(X(:,:),Y(:,:),Z(:,:),'g', 'linewidth', 1);
    hold on;
    plot3(cir(:,:,1),cir(:,:,2),cir(:,:,3),'r', 'linewidth', 1);
    hold on;
    plot3(-cir(:,:,1),-cir(:,:,2),-cir(:,:,3),'r', 'linewidth', 1);
    hold on;
    plot3(cir_dual(:,:,1),cir_dual(:,:,2),cir_dual(:,:,3),'b', 'linewidth', 1);
    hold on;
    plot3(-cir_dual(:,:,1),-cir_dual(:,:,2),-cir_dual(:,:,3),'b', 'linewidth', 1);
    hold on;
    
    f=true;
end

