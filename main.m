clear all
clc
path = './Data/';
D = dir(fullfile(path,'*.mat'));
for dd = 1: length(D)
    for i = 1:10
        ppath = ['./Data/',D(dd).name];
        [clustAssign,~,optTime,gtlabels,nCluster] = RCC(ppath, 100, 4);
        NNMI(i)= Cal_NMI(clustAssign',gtlabels');
        [ARI(i),~,~,~]=RandIndex(clustAssign',gtlabels');    
    end
        [~,Ind]=max(NNMI(:,1));
        finalresult(dd,1)=NNMI(Ind);
        finalresult(dd,2)=ARI(Ind);
        clearvars -except finalresult D path
end
finalresult