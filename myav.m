function [result]=myav(IMAGE)
[m,n] = size(IMAGE);
s=uint32(zeros(1));
for i = 1:m
    for j = 1:n
        I1=uint32(IMAGE(i,j));
        s=I1+s;
    end
end
result = s/(m*n);