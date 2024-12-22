[x, t] = readObj('ball.obj');

figure; subplot(121); trimesh(t, x(:,1), x(:,2), x(:,3), 'edgecolor', 'k'); axis equal; axis off; title('coarse mesh');


[x2, t2] = loop(x, t, 2);
subplot(122); trimesh(t2, x2(:,1), x2(:,2), x2(:,3), 'edgecolor', 'k'); axis equal; axis off; title('subdivision mesh');


%% TODO: finish the loop subdivision algorithm below 
function [x2, t2] = loop(x, t, n)
    x2 = x; 
    t2 = t;
    for i = 1 : n
        newx = [];
        for j = 1:length(t2)
            index_1=t2(j,1);
            index_2=t2(j,2);
            index_3=t2(j,3);
    
            point_1=x2(index_1,:);
            point_2=x2(index_2,:);
            point_3=x2(index_3,:);
    
            point_12=(point_1+point_2)/2;
            point_23=(point_2+point_3)/2;
            point_31=(point_3+point_1)/2;
            newx = vertcat(newx,[point_12;point_23;point_31]);
        end
        x2 = combine(x2, newx);%合并新旧顶点
        t2 = generateNewFaces(x2, t2);%生成新网格
        %更新点的位置
        J = adjacency_matrix(x2,t2);%得到邻接矩阵
        %disp(J)
        for s = 1:length(x2)
            k=sum(J(s,:));%点的度数
            beta_k=5/4-( 3+2*cos(2*pi/k) )^2/32;
            J(s,s)=k*(1-beta_k)/beta_k;
            J(s,:) = J(s,:)/sum(J(s,:));
        end
        x2=J*x2;
    end
end

function x = combine(oldx,newx)
%连接两个点列，并剔除newx中重复的点，oldx中默认没有重复的点
    [newx,ia,ic]=unique(newx,'rows');
    x=vertcat(oldx,newx);

end

function T=generateNewFaces(x, t)
%输入新旧点列x和网格t，生成新网格T
    nx=length(x);
    nt=length(t);
    T=zeros(4*nt,3);
    for i = 1:nt
        index_1=t(i,1);
        index_2=t(i,2);
        index_3=t(i,3);

        point_1=x(index_1,:);
        point_2=x(index_2,:);
        point_3=x(index_3,:);

        point_12=(point_1+point_2)/2;
        point_23=(point_2+point_3)/2;
        point_31=(point_3+point_1)/2;

        index_12=find(all(x==point_12,2));
        index_23=find(all(x==point_23,2));
        index_31=find(all(x==point_31,2));

        T(4*(i-1)+1,:)=[index_1,index_12,index_31];
        T(4*(i-1)+2,:)=[index_12,index_2,index_23];
        T(4*(i-1)+3,:)=[index_31,index_23,index_3];
        T(4*(i-1)+4,:)=[index_12,index_23,index_31];
    end
end

function  J=adjacency_matrix(points,mesh)
%生成邻接矩阵，无自环
    n=length(points);
    J=zeros(n,n);
    for i = 1:length(mesh)
        i1=mesh(i,1);
        i2=mesh(i,2);
        i3=mesh(i,3);
        J(i1,i2)=1;
        J(12,13)=1;
        J(i3,i1)=1;

        J(i2,i1)=1;
        J(i3,i2)=1;
        J(i1,i3)=1;
    end
end









