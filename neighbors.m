function [knn,rnn] = neighbors(X,k)
    n = size(X,1);
    kdtree = KDTreeSearcher(X,'bucketsize',1);
    [index,~] = knnsearch(kdtree,X,'k',200);
    knn = cell(1,n);
    rnn = cell(1,n);
    for i=1:n
        knn{i}(1:k) = index(i,2:k+1);
    end
    for ii = 1:n
        for jj = 2:k+1
            rnn{index(ii,jj)}(end+1) = ii;
        end
    end
end

