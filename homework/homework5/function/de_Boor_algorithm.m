function x = de_Boor_algorithm(t,d,T,k)
%DE_BOOR_ALGORITHM 此处显示有关此函数的摘要
%   此处显示详细说明
    n = length(d);
    r = find_the_interval(t,T,k);
    %下方算法错误，D应该是一个矩阵！！
    if r==n+1
        x=d(n);
    else
        %{
        D=zeros(n,n);
        for i = r-k+1:r
            D(i,1)=d(i);
        end
        for j =2:k
            for i=r-k+j:r
                alpha_i=0;

                if T(i+k-j-1)-T(i)~=0,alpha_i=(t-T(i))/(T(i+k-j-1)-T(i));end

                D(i,j)=(1-alpha_i)*D(i-1,j-1)+alpha_i*D(i,j-1);
            end
        end
        x=D(r,k);
        %}
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

