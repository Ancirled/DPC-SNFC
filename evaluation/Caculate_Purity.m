function Purity=Caculate_Purity(true_labels,labels,app)
% To compute purity , each cluster is assigned to the class which is most
% frequent in the cluster, and then the accuracy of this assignment is
% measured by counting the number of correctly assigned documents and
% dividing by length(c)

% High purity is easy to achieve when the number of clusters is large - in
% particular, purity is 1 if each document gets its own cluster. Thus, 
% we cannot use purity to trade off the quality of the clustering against 
% the number of clusters.



% based on http://www.cse.iitm.ac.in/~cs672/purity.pdf

 % the result and approach are exactly same in both approaches

if app==1
     cluster_count= length(unique(true_labels));
    for i=1:cluster_count
        memc=[];
        memc=find(true_labels==i);
        max_com=0;
        for j=1:cluster_count
            memp = find(labels==j);
            % number of items of class i assigned to cluster j.
            com = ismember(memp,memc);
            if sum(com)>max_com
                max_com=sum(com);
                pu(i,2)=j;
            end
        end
        pu(i,1)=( 1/length(memc))*max_com;
    end
    
    % The overall purity of a clustering solution could be expressed as a
    % weighted sum of individual cluster purities
    Purity=0;
    for i=1:cluster_count
        memc=[];
        memc=find(true_labels==i);
        Purity=Purity+ (length(memc)/length(true_labels))* pu(i,1);
        
    end
end
%-------------- second Approach ----------------
% based on:
% http://nlp.stanford.edu/IR-book/html/htmledition/evaluation-of-clustering-1.html

if app ==2

    cluster_count= length(unique(labels));
    pu=[1:cluster_count]'; % cluster numbers in p
    for i=1:cluster_count
        memc=[];
        memc=find(true_labels==i);
        max_com=0;
        for j=1:cluster_count
            memp = find(labels==j);
            % number of items of class j assigned to our cluster i.
            com = ismember(memp,memc);
            if sum(com)>max_com
                max_com=sum(com);
                pu(i,3)=max_com; % common objects
                pu(i,2)=j;
            end
        end
    end
    Purity=sum(pu(:,3))/length(true_labels);
end
end