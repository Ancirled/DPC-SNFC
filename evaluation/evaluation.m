function [AMI,ARI,FMI,NMI,Purity,RI] = evaluation(true_labels,labels,n,app)
%ACC = Caculate_ACC(true_labels,labels);
AMI = Caculate_AMI(true_labels,labels);
ARI = Caculate_ARI(true_labels,labels,n);
FMI = Caculate_FMI(true_labels,labels);
NMI = Caculate_NMI(true_labels,labels);
Purity = Caculate_Purity(true_labels,labels,app);
RI = Caculate_RI(true_labels,labels);
fprintf('Evaluation：AMI=%.4f，ARI=%.4f，FMI=%.4f，NMI=%.4f，Purity=%.4f，RI=%.4f\n',AMI,ARI,FMI,NMI,Purity,RI);
% fprintf('Evaluation：ACC=%.4f，AMI=%.4f，ARI=%.4f，FMI=%.4f，NMI=%.4f，Purity=%.4f，RI=%.4f\n',ACC,AMI,ARI,FMI,NMI,Purity,RI); %\n 表示换行
end

