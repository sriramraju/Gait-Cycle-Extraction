clc;
clear all;
close all;

load('C:\Users\Sriram Raju\My Own\UVa\Assignments\ADSP\Project\ADSP-2015-11-01\ADSP\matt_sri.mat');

for i=1:2
    for j=1:2
        
        temp = Data{i,j};
        out = waveletsPeakDetect(temp);
        
        segs{i,j} = getGait(temp,out);
        
    end
end

% plot(segs{1,1}{1})

%% Process the segs

% Input segs and get varies parameters for each cycle

[out_mean, out_var, out_engy , out_mse] = getPara(segs);

%% MSE

% normal vs brisk
out1 = dervmse(out_mse,1,1,1);  % p1-1: n-n
out2 = dervmse(out_mse,1,1,3);  % p1-1: n-b
out3 = dervmse(out_mse,2,1,2);  % p2-2: n-n
out4 = dervmse(out_mse,2,1,4);  % p2-2: n-b
out_x = [out1 out2 out3 out4];
out_grp = [ones(1,length(out1)) 2*ones(1,length(out2)) 3*ones(1,length(out3)) 4*ones(1,length(out4))];
boxplot(out_x,out_grp);title('MSE Comparison');ylabel('MSE values');

idx = kmeans([out3 out4],2);
length(find(idx(1:18)==1))
length(find(idx(19:end)==2))

% P 1-2
out1 = dervmse(out_mse,1,1,2);  % p1-2: n-n
out2 = dervmse(out_mse,1,2,4);  % p1-2: b-b
out_x = [out1 out2];
out_grp = [ones(1,length(out1)) 2*ones(1,length(out2))];
boxplot(out_x,out_grp)


%% Plots
clc
% out = out_mean;
% out = out_var;
out = out_engy;
temp_x = [out{1,1} out{1,2} out{2,1} out{2,2}];
temp_grp = [ones(length(out{1,1}),1) ; 2.*ones(length(out{1,2}),1) ; 3*ones(length(out{2,1}),1) ; 4*ones(length(out{2,2}),1)];
% boxplot(temp_x,temp_grp);title('Energy Comparison');

idx = kmeans([out{2,1} out{2,2}],2);

length(find(idx(1:17)==1))
length(find(idx(18:end)==2))