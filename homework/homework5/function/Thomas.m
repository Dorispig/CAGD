function x = Thomas(a,b,c,d)
%SOLVE_TRIDIAGONAL_EQUATION 此处显示有关此函数的摘要
%   此处显示详细说明
    n = length(d);
    for i = 2:n
        m = a(i-1) / b(i-1);
        b(i) = b(i) - m * c(i-1);
        d(i) = d(i) - m * d(i-1);
    end
    x = zeros(n, 1);
    x(n) = d(n) / b(n);
    for i = n-1:-1:1
        x(i) = (d(i) - c(i) * x(i+1)) / b(i);
    end
end

