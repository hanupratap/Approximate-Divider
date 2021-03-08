clc;
clear all;
close all;
count=0;
Ed=0;
er=0;
nmed=0;
med=0;
mred=0;
avgerr=0;
Edmax=0;
count=0;
nameArray = [];
for b=0.5:0.01:1
    answer_accurate=1./b;
    answer_approximate=app_ans(b);
    error = answer_accurate - answer_approximate;
    nameArray = [nameArray,error];
    Ed = abs(answer_accurate - answer_approximate);
    if(Ed~=0)
        count=count+1;
        er = er+1;
        med = med + Ed;
        avgerr = avgerr + (answer_accurate - answer_approximate);
        red=abs((answer_accurate-answer_approximate)/(answer_accurate));
        mred = mred+red;
    end
end
er = er/count;
med = med/count;
mred = mred/count;
b=0.5:0.01:1;
plot(b,nameArray);



