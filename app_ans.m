function [answer_approximate]=app_ans(b)
    if b == 0.5
        answer_approximate = 2;
    elseif 0.5<b && b<0.5625
         answer_approximate=(-(2^1)-(2^0)-(2^-1)-(2^-2)-(2^-3)-(2^-4))*b + 2 + 1 + 0.5 + 0.25 + 0.125+0.0625+0.03125;
    elseif 0.5625 <= b && b < 0.625
        answer_approximate=(-(2^1)-(2^-1)-(2^-2)-(2^-3))*b + 2 + 1 + 0.25 + 0.125;
    elseif 0.625 <=b && b<0.75
        answer_approximate=(-(2^1)-(2^-4))*b +  2 + 0.5 + 0.25 +  0.125;
    elseif 0.75 <= b && b < 0.875
        answer_approximate=(-(2^0)-(2^-1))*b + 2+ +0.25 + 0.0625 + 0.125;
    else
        answer_approximate=(-(2^0)-(2^-3))*b + 2 + 0.125;
    end
end