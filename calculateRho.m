function [rho] = calculateRho(dist,knn)
    n=size(dist,1);
    rho = ones(n,1);
    for i=1:n
        rho(i) =exp(-sum(dist(i,knn{i}(1:length(knn{i}))))/length(knn{i}));
    end
end
