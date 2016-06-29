function out = getmse(sig,in)

sig = resample(sig,100,length(sig));
cnt = 0;
for i=1:2
    for j=1:2
        cnt = cnt + 1;
        temp = in{i,j};
        
        for k=1:length(temp)
            
            Csig = resample(temp{k},100,length(temp{k}));
            wt(k) = mean((sig - Csig).^2);
            
        end

        out(i,j) = mean(wt);
    end
end
            
            