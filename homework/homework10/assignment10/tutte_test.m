[x, t] = readObj('cathead.obj');

figure; subplot(121); trimesh(t, x(:,1), x(:,2), x(:,3), 'edgecolor', 'k'); axis equal; axis off; title('input mesh');

y = tutte_embed(x, t);

subplot(122); trimesh(t, y(:,1), y(:,2), y(:,1)*0, 'edgecolor', 'k'); axis equal; axis off; title('Tutte embedding'); view(2);


%% TODO: finish the Tutte embedding algorithm below 
function y = tutte_embed(x, t)
    B = findBoundary(x, t); % find the exterior boundary of the mesh
    %y = x(:, 1:2);
    J=zeros(size(x,1),size(x,1));
    %邻接矩阵J
    for i = 1 : size(t,1)
        J(t(i,1),t(i,2))=1;
        J(t(i,1),t(i,3))=1;
        J(t(i,2),t(i,1))=1;
        J(t(i,2),t(i,3))=1;
        J(t(i,3),t(i,1))=1;
        J(t(i,3),t(i,2))=1;
    end
    %disp(J);
    for i = 1:size(x,1)
        if(ismember(i,B))
            J(i,:) = 0;
        else
            J(i,:) = J(i,:)/sum(J(i,:));
        end
    end
    %disp(J);
    J = eye(size(x,1))-J;
    b = zeros(size(x,1),2);
    for i = 1 : size(B,2) 
        b(B(i),1)=cos(i*2*pi/size(B,2)); 
        b(B(i),2)=sin(i*2*pi/size(B,2)); 
    end
    A=sparse(J);
    y=A\b;
end