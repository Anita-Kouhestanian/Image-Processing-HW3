function [RESULT]=mythresholding(f)
mean = myav(f);
t=mean;
i=0;
w=1;
while w~=0
    
    
    % find values below
    ind_below = (f < t);
    % find values above
    ind_above = (f >= t);
    
    mean1=myav(f(ind_below));
    mean2=myav(f(ind_above));
    t1=t;
    t=(mean1+mean2)/2;
    i=i+1;
    w=t1-t;
end
RESULT=double(double(t)/255);