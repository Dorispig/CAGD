function x = de_Boor_algorithm(t,d,T,k)
%DE_BOOR_ALGORITHM 用de Boor算法求在t点的B样条曲线的值，满足保持首尾点不变
%   要求:length(T)=length(d)+2*(k-1)
%   t:输入参数
%   d:de Boor Points
%   T:Knot Vector
%   k:B样条阶数（次数+1）
    n = length(d);
    r = find_the_interval(t,T,k);
    if r==n+1
        x=d(n);
    else
        D=zeros(k,k);
        for i = 1:k
            D(i,1)=d(r-k+i);
        end
        for j =2:k
            for i=j:k
                alpha_i=0;

                if T(i+r-j+1)-T(i+r-k)~=0,alpha_i=(t-T(i+r-k))/(T(i+r-j+1)-T(i+r-k));end

                D(i,j)=(1-alpha_i)*D(i-1,j-1)+alpha_i*D(i,j-1);
            end
        end
        x=D(k,k);
    end
end

