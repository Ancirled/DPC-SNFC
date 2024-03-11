function  Plot(X,labels)
NC=length(unique(labels));
figure;
colormap hsv
cmap=colormap;
cmap=cmap(round(linspace(1,length(cmap),NC+1)),:);
cmap=cmap(1:end-1,:)*0.5+0.4;
for i=1:NC
    plot(X(labels == i,1), X(labels == i,2),'.','Markersize',18,'color',cmap(i,:));
    hold on;
end
xlabel('');
ylabel('');
title('');

TC = length(unique(X(:,end)));
figure;
colormap jet
cmap=colormap;
cmap=cmap(round(linspace(1,length(cmap),TC+1)),:);
cmap=cmap(1:end-1,:);
for i=1:TC
    plot(X(X(:,end) == i,1), X(X(:,end) == i,2),'.','Markersize',18,'color',cmap(i,:));
    hold on;
end
title('real');
end

