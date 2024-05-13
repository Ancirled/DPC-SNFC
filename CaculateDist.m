function [dist] = CaculateDist(X)
%% 计算距离矩阵
    dist = pdist2(X,X);   %计算两点间的欧式距离，形成距离矩阵
    n = size(dist,1);
    for i=1:n
        dist(i,i)=inf;      %将距离矩阵中，点到自己的距离设置为无穷
    end
end

