function x =  Biquadratic_surfaces(p,w,u,v)
%Biquadratic_surfaces 用双二次有理Bezier样条
%   @param p:(i*j*xyz)3*3*3的控制点
%   @param w:控制点对应的weight
%   @param u,v:参数
    Bu=[(1-u)^2,2*u*(1-u),u^2];
    Bv=[(1-v)^2;2*v*(1-v);v^2];
    wp = w.*p;
    x=[0,0,0];
    x(1)=Bu*wp(:,:,1)*Bv;
    x(2)=Bu*wp(:,:,2)*Bv;
    x(3)=Bu*wp(:,:,3)*Bv;
    wB=Bu*w*Bv;
    x = x / wB;
end

