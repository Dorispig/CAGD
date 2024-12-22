function [x,x_dual] = ellipsoid(a,b,c)
%ellipsoid ：用双二次Bezier样条表示标准椭圆x^2/a^2+y^2/b^2+z^2/c^2=1:
    n = 200;
    u = 0:1/n:1;
    v = 0:1/n:1;

    p = zeros(3,3,3);
    p(1,1,:)=[0,b,0];p(1,2,:)=[a,b,0];p(1,3,:)=[a,0,0];
    p(2,1,:)=[0,b,c];p(2,2,:)=[a,b,c];p(2,3,:)=[a,0,c];
    p(3,1,:)=[0,0,c];p(3,2,:)=[0,0,c];p(3,3,:)=[0,0,c];

    %w = [[1,sqrt(2)/2,1];
    %    [1,sqrt(2)/2,1];
    %    [1,sqrt(2)/2,1]];
    w = [[1,sqrt(2)/2,1];
        [sqrt(2)/2,1/2,sqrt(2)/2];
        [1,sqrt(2)/2,1]];
    x = zeros(n,n,3);
    %w_dual = [[1,-sqrt(2)/2,1];
    %    [1,-sqrt(2)/2,1];
    %    [1,-sqrt(2)/2,1]];
    w_dual = [[1,-sqrt(2)/2,1];
        [sqrt(2)/2,-1/2,sqrt(2)/2];
        [1,-sqrt(2)/2,1]];
    x_dual = zeros(n,n,3);
    for i = 1:n
        for j = 1:n
            x(i,j,:)=Biquadratic_surfaces(p,w,u(i),v(j));
            x_dual(i,j,:)=Biquadratic_surfaces(p,w_dual,u(i),v(j));
        end
    end
    
end

