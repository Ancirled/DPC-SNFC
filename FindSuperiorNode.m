function [S] = FindSuperiorNode(rnn,dist,rho)
    n = size(dist,1);
    [~, ord_rho] = sort(rho, 'descend');
    delta = zeros(n,1);
    S = zeros(n,1);     %使用向量距离每个点的上级节点
    S(ord_rho(1)) = ord_rho(1);    %密度最高的点以自己作为上级节点
    mean = 0;
    for i = 1:n
        mean = mean+length(rnn{i})/n;
    end
    %先在反向最近邻中找密度更高的最近邻作为上级节点
    for i = 2 : n
        delta(ord_rho(i)) = max(dist(ord_rho(i), :));
        for j = 1 : (i-1)
            if (dist(ord_rho(i), ord_rho(j)) < delta(ord_rho(i))&&ismember(ord_rho(j),rnn{ord_rho(i)}))
                delta(ord_rho(i)) = dist(ord_rho(i), ord_rho(j));
                S(ord_rho(i))=ord_rho(j);
            end
        end
    end
    %对于反向最近邻中没有密度更高最近邻的点进行额外的判断，根据点的特点采取不同的方法寻找上级节点
    for i = 2 : n
        %离群点,反向最近邻的数目小于所有点的反向最近邻数目的平均值，在全局范围内寻找密度更高的最近邻作为上级节点
        if (S(ord_rho(i))==0&&length(rnn{ord_rho(i)})<mean)
            for j = 1 : (i-1)
                if (dist(ord_rho(i), ord_rho(j)) < delta(ord_rho(i)))
                    delta(ord_rho(i)) = dist(ord_rho(i), ord_rho(j));
                    S(ord_rho(i))=ord_rho(j);
                end
            end
        %局部密度峰,反向最近邻的数目大于等于所有点的反向最近邻数目的平均值，以自己作为上级节点
        elseif (S(ord_rho(i))==0&&length(rnn{ord_rho(i)})>=mean)
            S(ord_rho(i))=ord_rho(i);
        end
    end
end

