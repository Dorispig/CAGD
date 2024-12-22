function x = Rational_Bezier_Spline(p,w,t)
%RATIONAL_BEZIER_SPLINE 用de Casteljau Algorithm计算有理Bezier样条曲线
%   @param p:Control points.
%   @param w:Weights of every control points.
%   @param r:Ordinal number of rational Bezier Spline
%   @param t:parameter of spline points
%   @return x:Rational Bezier Spline points vector,x(t)=[x1,x2,w]
    n = length(w);
    x = zeros(length(t),2);
    z = zeros(length(t),1);
    min = t(1);
    max = t(end);
    for i = 1:length(t)
        b=p;
        W=w;
        for j=1:n-1
            for k=1:n-j
                wjk=(1-t(i))*W(k)+t(i)*W(k+1);
                b(k,:)=(max-t(i))*W(k)/wjk*b(k,:)+(t(i)-min)*W(k+1)/wjk*b(k+1,:);
                W(k)=wjk;
            end
        end
        x(i,:)=b(1,:);
        z(i)=W(1);
    end
    x=[x(:,1).*z,x(:,2).*z,z];
end

