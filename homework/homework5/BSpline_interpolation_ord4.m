function x = BSpline_interpolation_ord4(p,h,h_s,h_De)
%BSPLINE_INTERPOLATION 此处显示有关此函数的摘要
%   此处显示详细说明
    p = p*[1;1i];
    n = length(p);
    t = 0:0.001:n-1;
    x = zeros(1,length(t));
    s = 0:1:n-1;%n个数
    T = [zeros(1,3),s,(n-1)*ones(1,3)];%[0,0,0,0,1,2,...,n-2,n-1,n-1,n-1,n-1]n+6个数
    %计算基函数N_{i,4}在sj上的取值，存在N(k,i,j)=N_{i,k}(s_j)中
    %N的有用形状：N(k)size：(n+6-k)*n
    N = zeros(4,n+5,n);
    for i = 4:n+2
        N(1,i,i-3)=1;
    end
    for k = 2:4
        for i = 1:n+6-k
            %for j = max(1,i-2):min(i+k-4,n)
            for j = 1:n
                n1=0;
                n2=0;
                if T(i+k-1)-T(i)~=0
                    n1 = (s(j)-T(i))/(T(i+k-1)-T(i)) * N(k-1,i,j);
                end
                if T(i+k)-T(i+1)~=0
                    n2 = (T(i+k)-s(j))/(T(i+k)-T(i+1)) * N(k-1,i+1,j);
                end
                N(k,i,j) = n1 + n2;
            end
        end
    end
    disp(N(2,:,:))
    %构造方程组
    alpha = zeros(1,n);
    beta = zeros(1,n);
    gamma = zeros(1,n);

    alpha(1)=s(3)-s(1);
    beta(1)=2*s(1)-s(2)-s(3);
    gamma(1)=s(2)-s(1);

    for i = 2:n-1
        alpha(i)=N(4,i,i);
        beta(i)=N(4,i+1,i);
        gamma(i)=N(4,i+2,i);
    end

    alpha(n)=s(n)-s(n-1);
    beta(n)=s(n-2)+s(n-1)-2*s(n);
    gamma(n)=s(n)-s(n-2);

    P = [p(1),0,transpose(p(2:n-1)),0,p(n)];
    d = Thomas([alpha,0],[1,beta,1],[0,gamma],P);%求解控制点di
    for i = 1:length(t)
        x(i) = de_Boor_algorithm(t(i),d,T,4);%由控制点求得B样条插值曲线，该曲线过插值点pi
    end
    %p = x;
    if nargin>1,set(h, 'xdata', real(x), 'ydata', imag(x)); end
    if nargin>2,set(h_s, 'xdata', real(d), 'ydata', imag(d)); end
    if nargin>3,set(h_De,'xdata', real(d), 'ydata', imag(d)); end
end

