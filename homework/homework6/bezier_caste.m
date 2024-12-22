function p = bezier_caste(p, t, h)
    p = p*[1;1i];
    x = zeros(1,length(t));
    n=length(p);
    for i = 1:length(t)
        b=p;
        for j = 1:n-1
            for k = n:-1:j+1
                b(k) = t(i)*b(k)+(1-t(i))*b(k-1);
            end
        end
        x(i)=b(n);
    end
    p=x;
    if nargin>2,set(h, 'xdata', real(p), 'ydata', imag(p)); end
end

