function [father] = FindSuperiorNode(rnn,dist,rho)
    n = size(dist,1);
    [~, ord_rho] = sort(rho, 'descend');
    delta = zeros(n,1);
    father = zeros(n,1);
    mean = 0;
    for i = 1:n
        mean = mean+length(rnn{i})/n;
    end
    
    
    
    
    
    
    
end

