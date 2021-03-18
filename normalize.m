function [ex,x] = normalize(num, n_bits)
    arr = de2bi(num, 'left-msb', 2*n_bits);
    idx = 1;
  
    temp_or = false;
    temp_and = true;
    
    
    while(idx <= 2*n_bits)
        if(arr(idx) == 1)
            break;
        end
        idx = idx+1;
    end
    
    lod = 2*n_bits-idx+1;
    ex = lod;
    
    x = 0;
    temp = -1;
    lim = min(idx+n_bits-1, 2*n_bits);
   
    while(idx<=lim)
        if(arr(idx) == 1)
            x = x + 2^(temp);
        end
        temp_and = temp_and & arr(idx);
        
        idx = idx+1;
        if(idx>lim)
            break;
        end
        temp = temp - 1;
    
    end
    
    while(idx<2*n_bits && idx<lim+n_bits/2)
        temp_or = temp_or | arr(idx);
        if(temp_or)
            break;
        end
        idx = idx+1;
    end
    
    if(temp_or && temp_and)
        x=1;
    elseif(temp_or)
        x = x + 2^temp;
    end
        disp(temp);
        disp(temp_and);
        disp(temp_or);
        disp(arr);
        disp(x);
        disp(lod);
        
    
end