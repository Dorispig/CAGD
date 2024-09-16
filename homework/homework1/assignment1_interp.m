figure; 
h = impoly('closed', false);
z = h.getPosition;
n = size(z, 1);
x = z(:,1);
y = z(:,2);

hold on;

fInterpPoly = @(x, y, xs) xs;
fInterpRBF = @(x, y, xs) xs;

xs = (0:0.01:1)';
hpoly = plot(xs, fInterpPoly(x, y, xs), 'r', 'linewidth', 2);
hrbf = plot(xs, fInterpRBF(x, y, xs), 'g', 'linewidth', 2);

h.addNewPositionCallback(@(y) set(hpoly, 'ydata', fInterpPoly(y(:,1),y(:,2), xs)) );
h.addNewPositionCallback(@(y) set(hrbf, 'ydata', fInterpRBF(y(:,1),y(:,2), xs)) );

legend('Polynomial', 'RBF'); %axis manual; 

%%
function [result] = rbf(n,x,y)


end

