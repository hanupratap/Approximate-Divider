clc;
clear all;
close all;
Ed=0;
er=0;
nmed=0;
med=0;
mred=0;
avgerr=0;
Edmax=0;
count=0;
nameArray = [];
idx = [];
val = 0;

num_mx_error=0;
denom_mx_error=0;

%number of bits (2*n_bits/n_bits)
n_bits = 8;

disp("Starting simulation...");

for i = 1:1000
    num = randi(2^(2*n_bits)-1);
    denom = randi(num);
    
    val = val+1;
    
%     idx = [idx, val];
    answer_accurate = num/denom;
    answer_approximate = main(num, denom, n_bits);
    
    error = answer_accurate - answer_approximate;
    
%     nameArray = [nameArray,error];
    
    Ed = abs(error);
    count=count+1;
    
    if(Ed~=0)
        er = er+1;
        red=abs(error/(answer_accurate));
        mred = mred+red;
        med = med + Ed;
        avgerr = avgerr + error;
        if(Ed>Edmax)
            Edmax = Ed;
            num_mx_error = num;
            denom_mx_error = denom;
        end
    end
end

disp("simulation Finished.");

% for b=0.5:0.01:1
%     answer_accurate=1./b;
%     answer_approximate=app_ans(b);
%     error = answer_accurate - answer_approximate;
%     nameArray = [nameArray,error];
%     Ed = abs(answer_accurate - answer_approximate);
%     if(Ed~=0)
%         count=count+1;
%         er = er+1;
%         med = med + Ed;
%         avgerr = avgerr + (answer_accurate - answer_approximate);
%         red=abs((answer_accurate-answer_approximate)/(answer_accurate));
%         mred = mred+red;
%     end
% end

er = er/count;
med = med/count;
nmed = med/(2^n_bits+1);
mred = mred/count;
avgerr = avgerr/count;

disp(['Operation :' num2str(2*n_bits) '/' num2str(n_bits)]);

disp("AVG error:");
disp(avgerr);

disp("Error rate (in percent):");
disp(er*100);

disp("Mean error distance");
disp(med);

disp("MRED");
disp(mred);

disp("NMED");
disp(nmed);

disp("MAX ERROR at -");
disp(['Numerator : ' num2str(num_mx_error)]);
disp(['Denominator : ' num2str(denom_mx_error)]);
disp(['Error Distance : ' num2str(Edmax)]);
% plot(idx,nameArray);



