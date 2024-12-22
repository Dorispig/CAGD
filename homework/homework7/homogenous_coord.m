function q = homogenous_coord(p,w)
%homogenous_coord 返回坐标向量p的齐次坐标,w默认为1，行列向量均可，若为2维向量，要求每一行为一个点坐标
%   @param p=[x1,x2,...,xn]
%   @return q=(wx1,wx2,...,wxn,w)
    if nargin<2 ; w=1;end
    if numel(size(p))==2
        [m,n]=size(p);
        q=zeros(m,n+1);
        for i=1:size(p)
            if isrow(p(i,:))
                q(i,:)=[w*p(i,:),w];
            else
                %q(i,:)=[w*p(i,:);w];
                disp("每一行都要是行向量\n");
                break;
            end
        end
    else
        if isrow(p); q=[w*p,w];end
        if iscolumn(p); q=[w*p;w];end
    end
end

