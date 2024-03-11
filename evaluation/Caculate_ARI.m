function [ARI] =Caculate_ARI(true_labels,labels,n)
TP=0;
TN=0;
FP=0;
FN=0;
for xi=1:n-1
    for xj=xi+1:n
        TP=TP+((labels(xi)==labels(xj))&&(true_labels(xi)==true_labels(xj)));
        TN=TN+((labels(xi)~=labels(xj))&&(true_labels(xi)~=true_labels(xj)));
        FP=FP+((labels(xi)~=labels(xj))&&(true_labels(xi)==true_labels(xj)));
        FN=FN+((labels(xi)==labels(xj))&&(true_labels(xi)~=true_labels(xj)));
    end
end
A=2*((TP*TN)-(FP*FN));
B=((TP+FP)*(FP+TN))+((TP+FN)*(FN+TN));
adjusted_rand_index=A/B;
ARI=adjusted_rand_index;
end