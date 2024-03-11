function [dist] = CaculateDist(X)
    dist=pdist2(X,X);
    n = size(dist,1);
    for i=1:n
        dist(i,i)=inf;
    end
end

