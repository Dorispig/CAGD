figure; 
h = impoly('closed', false);
z = h.getPosition;
n = size(z, 1);
x = z(:,1);
y = z(:,2);

hold on;

fInterpPoly = @(x, y, xs) poly(x, y, xs);
fInterpRBF = @(x, y, xs,ord) rbf(x, y, xs,ord);

xs = (0:0.01:1)';
hpoly = plot(xs, fInterpPoly(x, y, xs), 'r', 'linewidth', 2);
hrbf = plot(xs, fInterpRBF(x, y, xs,0), 'g', 'linewidth', 2);
hrbf1 = plot(xs, fInterpRBF(x, y, xs,1), 'b', 'linewidth', 2);
hrbf2 = plot(xs, fInterpRBF(x, y, xs,2), 'y', 'linewidth', 2);
hrbf3 = plot(xs, fInterpRBF(x, y, xs,3), 'k', 'linewidth', 2);

%h.addNewPositionCallback(@(y) set(hpoly, 'ydata', fInterpPoly(y(:,1),y(:,2), xs)) );
%h.addNewPositionCallback(@(y) set(hrbf, 'ydata', fInterpRBF(y(:,1),y(:,2), xs,0)) );
%h.addNewPositionCallback(@(y) set(hrbf1, 'ydata', fInterpRBF(y(:,1),y(:,2), xs,1)) );
%h.addNewPositionCallback(@(y) set(hrbf2, 'ydata', fInterpRBF(y(:,1),y(:,2), xs,2)) );
%h.addNewPositionCallback(@(y) set(hrbf3, 'ydata', fInterpRBF(y(:,1),y(:,2), xs,3)) );

legend('Polynomial', 'RBF',"RBF1","RBF2","RBF3"); %axis manual; 

%%
function [result] = rbf(x,y,xs,ord)
    if nargin<4
        ord=0;
    end
    n=size(x,1);
    %求b0
    C=zeros(n,ord+1);
    for i=1:ord+1
        C(:,i)=x.^(i-1);
    end
    c=C\y;
    e=C*c;
    %拟合bi
    d=0.001;
    A=zeros(n,n);
    for i = 1 : n
        for j = 1 : n
            A(i,j)=1/((x(j)-x(i))^2+d);
        end
    end
    b = A\(y-e);
    m=size(xs,1);
    result =zeros(m,1);
    for i=1:m
        result(i)=c(1);
        for j=2:ord+1
            result(i)=result(i)+c(j)*xs(i)^(j-1);
        end
        for j = 1 : n
            result(i) = result(i)+b(j)*1/((xs(i)-x(j))^2+d);
        end
    end
end
%%
function [result] = poly(x,y,xs)
    n=size(x,1);
    b=zeros(n,1);
    A=zeros(n,n);
    for i=1:n
        A(:,i)=x.^(i-1);
    end
    b(:,1) = A\y;
    result=zeros(size(xs,1),1);
    for i=1:n
        result =result + b(i)*xs.^(i-1);
    end
end