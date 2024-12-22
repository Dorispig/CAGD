%指定center和d
center=[0,0,9];
d=1;
%指定相机位置和方向(朝z轴正方向)
camrea_position=[0,0,-10];
offsets = d * [-1,-1,-1; 1,-1,-1; 1,1,-1; -1, 1 -1; -1, -1, 1; 1, -1, 1; 1, 1, 1; -1, 1, 1];
vertices=offsets+center;
%焦距vertices
focal_length=5;
%投影矩阵
project_matrix=[focal_length,0,0,0;0,focal_length,0,0;0,0,focal_length,0;0,0,1,0];
%计算时都是相对于相机位置做相似,故先减后加
%定义邻接矩阵
edges=[1,2;2,3;3,4;4,1;5,6;6,7;7,8;8,5;1,5;2,6;3,7;4,8];
v=zeros(8,4);
v(:,1:3)=vertices-camrea_position;
%加上齐次坐标
v(:,4)=1;
v=project_matrix*v'+[camrea_position,1]';
v=v';
projected_vertice=[v(:,1)./v(:,4),v(:,2)./v(:,4)];
x=[projected_vertice((edges(:,1)),1:2),projected_vertice((edges(:,2)),1:2)];
plot([x(:,1),x(:,3)]',[x(:,2),x(:,4)]','b-');
