function [G] = FuzzyCorrelation(rho,S,rnn,gama)
    n = length(rho);
    a = 1;
    visited = zeros(1,n);
%% gama次密度更高的最近邻（gama级节点）与其反向最近邻相连
    %每个点与上级节点关联
    for i = 1:n
        s(a) = i;
        t(a) = S(i);
        a = a+1;
    end
    %gama级节点与其反向最近邻相连
    for i = 1:n
        num = 1;
        b = i;
        while num < gama
            c = S(b);
            b = c;
            num = num+1;
        end
        if (visited(c) == 0)  %避免一个点多次与其反向最近邻相连
            visited(c) = 1;
            for j = 1:length(rnn{c})
                s(a) = c;
                t(a) = rnn{c}(j);
                a = a+1;
            end
        end
    end
%     for i = 1:n
%         num = 1;
%         if (father(i)~=i)
%             s(a) = i;
%             t(a) = father(i);
%             while num < gama
%                 if (father(t(a))~=t(a))
%                     s(a+1) = t(a);
%                     t(a+1) = father(t(a));
%                     a = a+1;
%                 end
%                 num = num+1;
%             end
%             b = t(a);
%             for j = 1 : length(rnn{b})
%                 s(a+1) = b;
%                 t(a+1) = rnn{b}(j);
%                 a = a+1;
%             end
%         end
%     end
    G = graph(s,t);
end

