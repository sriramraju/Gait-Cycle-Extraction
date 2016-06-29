function [out_mean, out_var, out_engy, out_mse] = getPara(in)

for i=1:2
    for j=1:2
        
        temp = in{i,j};
        
        for k=1:length(temp)
            
            out_mean{i,j}(k) = mean(temp{k});
            out_var{i,j}(k) = var(temp{k});
            out_engy{i,j}(k) = sum( temp{k}.^2 );
        end
    end
end

for i=1:2
    for j=1:2
        
        temp = in{i,j};
        
        for k=1:length(temp)
            
            ref_sig = temp{k};
            out_mse{i,j}{k} = getmse(ref_sig,in);
            
        end
    end
end


        