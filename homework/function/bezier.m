function p = bezier(p, t, h)
    p = p*[1;1i];
    x = zeros(1,length(t));
    n=length(p)-1;
    for i = 1:length(t)
        for j = 1:n+1
            x(i) = x(i) + factorial (n)/(factorial (n-j+1)*factorial (j-1))*t(i)^(j-1)*(1-t(i))^(n-j+1)*p(j);
        end
    end
    p=x;
    if nargin>2,set(h, 'xdata', real(p), 'ydata', imag(p)); end
end

