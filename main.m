function [res]=main(num, denom, n_bits)
    [ea,a] = normalize(num, n_bits);
    [eb,b] = normalize(denom, n_bits);
    
%     disp(denom);
%     disp(eb);
%     
    Rb = app_ans(b);
    
    % Calculating a/b
    %temp = a*Rb;
    
%      disp(a*Rb);
    
    res = a*Rb*2^(ea-eb);
    
end