function p = bezier_3(p, t, h)
    p = p*[1;1i];
    n = length(p);
    m = length(t);
    x = zeros(1,(n-1)*length(t));
    A = zeros(3*n-2,3*n-2);
    b = [p;zeros(2*n-2,1)];

    A(1,1) = 1;
    A(3*n-3,1:3)=[1,-2,1];
    for i = 2:n-1
        A(i,3*i-2)=1;
        A(n+(2*i-3),(3*i-3):(3*i-1))=[1,-2,1];
        A(n+(2*i-2),(3*i-4):(3*i))=[1,-2,0,2,-1];
    end
    A(n,3*n-2) = 1;
    A(3*n-2,3*n-4:3*n-2)=[1,-2,1];
    z=A\b;

    for i = 1:n-1
        for j = 1:m
            x((i-1)*length(t)+j)=(1-t(j))^3*z(3*i-2)+3*(1-t(j))^2*t(j)*z(3*i-1)+3*(1-t(j))*t(j)^2*z(3*i)+t(j)^3*z(3*i+1);
        end
    end
    p=x;
    if nargin>2,set(h, 'xdata', real(p), 'ydata', imag(p)); end
end


