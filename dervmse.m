function out = dervmse(out_mse,i1,j1,m)

out = [];
for i=i1
    for j=j1
        temp = out_mse{i,j};
        
        for k=1:length(temp)
            temp1 = temp{k}(:);
            out = [out temp1(m)];
        end
        
    end
end
