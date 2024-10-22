figure; 
t = 0:0.001:1;

%%
h = drawpolyline;
hold on;
hcurve = plot(bezier(h.Position, t), 'g', 'linewidth', 2);
h.addlistener('MovingROI', @(h, evt) bezier(evt.CurrentPosition, t, hcurve));
legend('bezier');

%hcurve_caste = plot(bezier_caste(h.Position, t), 'r', 'linewidth', 2);
%h.addlistener('MovingROI', @(h, evt) bezier_caste(evt.CurrentPosition, t, hcurve_caste));
%legend('bezier caste');


%%
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








