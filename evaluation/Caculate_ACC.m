function [ACC]=Caculate_ACC(true_labels,labels)
% function [Acc,rand_index,match]=Caculate_ACC(T,idx)
%Measure percentage of Accuracy and the Rand index of clustering results
% The number of class must equal to the number cluster 

%Output
% Acc = Accuracy of clustering results
% rand_index = Rand's Index,  measure an agreement of the clustering results
% match = 2xk mxtrix which are the best match of the Target and clustering results

%Input
% T = 1xn target index
% idx =1xn matrix of the clustering results

% EX:
% X=[randn(200,2);randn(200,2)+6,;[randn(200,1)+12,randn(200,1)]]; T=[ones(200,1);ones(200,1).*2;ones(200,1).*3];
% idx=kmeans(X,3,'emptyaction','singleton','Replicates',5);
%  [Acc,rand_index,match]=Acc_measure(T,idx)

k=max(true_labels);
n=length(true_labels);
for i=1:k
    temp=find(true_labels==i);
    a{i}=temp; %#ok<AGROW>
end

b1=[];
t1=zeros(1,k);
for i=1:k
    tt1=find(labels==i);
    for j=1:k
       t1(j)=sum(ismember(tt1,a{j}));
    end
    b1=[b1;t1]; %#ok<AGROW>
end
    Members=zeros(1,k); 
    
P = perms((1:k));
    Acc1=0;
for pi=1:size(P,1)
    for ki=1:k
        Members(ki)=b1(P(pi,ki),ki);
    end
    if sum(Members)>Acc1
        match=P(pi,:);
        Acc1=sum(Members);
    end
end

rand_ss1=0;
rand_dd1=0;
for xi=1:n-1
    for xj=xi+1:n
        rand_ss1=rand_ss1+((labels(xi)==labels(xj))&&(true_labels(xi)==true_labels(xj)));
        rand_dd1=rand_dd1+((labels(xi)~=labels(xj))&&(true_labels(xi)~=true_labels(xj)));
    end
end
rand_index=200*(rand_ss1+rand_dd1)/(n*(n-1))/100;
ACC=Acc1/n; 
match=[1:k;match];