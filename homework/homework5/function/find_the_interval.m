function r = find_the_interval(t,T,k)
% find_the_interval 查找t在T中的哪个区间
% T(r)<=t<T(r+1)
% return:r
    n=length(T);
    i=1;
    j=n;
    mid=fix((i+j)/2);
    while(i<j)
        if t>=T(mid),i=mid+1;end
        if t<T(mid+1),j=mid;end
        mid = fix((i+j)/2);
    end
    r=mid;
    if r==n,r=n-k+1;end
end

