clear all; close all; clc;

%% 导入数据
fileName = 'flame.txt';
X = load(fileName);

% fileName = 'All Datasets/real/Iris.mat';
% load(fileName);
% X = Iris;                                       
% X(:,end+1) = label;                           

A = X;
A(:,end) = [];                                       
T = X(:,end);                 % True label

%% Parameters
lemda = 10;
gama = 3;

%% Prepare
% A=normalize(A);
n = size(A,1);                             
dist = CaculateDist(A);                     
[knn,rnn] = neighbors(X,lemda);         
rho = calculateRho(dist,knn);            
[father] = FindSuperiorNode(rnn,dist,rho);     

%% construct graph
G = construct_rnn(rho,father,rnn,gama);
[labels,c] = conncomp(G);               
Plot(X,labels);
[AMI,ARI,FMI,NMI,Purity,RI] = evaluation(T,labels',n,2);  