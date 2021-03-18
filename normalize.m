function [ex,x] = normalize(num, n_bits)
    arr = de2bi(num, 'left-msb', 2*n_bits);
    idx = 1;
 
    
    while(idx <= 2*n_bits)
        if(arr(idx) == 1)
            break;
        end
        idx = idx+1;
    end
    
    lod = 2*n_bits-idx+1;
    x = 0;
    temp = -1;
    lim = min(idx+n_bits-1, 2*n_bits);
    
    while(idx<=lim)
        if(arr(idx) == 1)
            x = x + 2^(temp);
        end

        temp = temp - 1;
        idx = idx+1;
    
    end
    
     
%        disp(arr);
%        disp(x);
%        disp(lod);
   ex = lod;
    
end