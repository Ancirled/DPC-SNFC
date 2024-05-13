function [rho] = CalculateRho(dist,knn)
%% 局部密度估计
    n=size(dist,1);
    rho = ones(n,1);        %使用向量记录每个点的密度
    for i=1:n
        rho(i) =exp(-sum(dist(i,knn{i}(1:length(knn{i}))))/length(knn{i}));
    end
end
