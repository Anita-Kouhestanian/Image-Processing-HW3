%% Question 3
I_Original=imread('hw3_image1.tif');
I_captured=imread('hw3_image1_lines.tif');
%fist compute SE for shortest line
SE1 = strel('line', 35, 45);
%applying imopen to omit all other objects exept 45 degrees lines
I_open1=imopen(I_captured,SE1);
I_O_open1=imopen(I_Original,SE1);
%then compute SE for longest line
SE2 = strel('line', 50, 45);
I_open2=imopen(I_captured,SE2);
I_O_open2=imopen(I_Original,SE2);
%using or operation to show all line artifacts
I_open=or(I_open1,I_open2);
I_O_open=or(I_O_open1,I_O_open2);
% to omit lines that are part of original image but has 45 degrees from
% line artifacts I substracted the original image from captured one
I=I_open-I_O_open;
figure,imshow(I)
%computing the number of lines
[L,Num]=bwlabel(I);
for i=1:Num
    figure;
    imshow(L==i)
    pause(1)
end
fprintf('Number Of line artifacts: %d \n \n',Num)


%% Question 4
f = imread('hw3_image2.jpg');
%imtool(f)
tear=imcrop(f,[238.25 157.25 39 48]);
n=size(tear);
SE = strel('disk',5);
f_dilate=imdilate (f,SE);
imshow(f_dilate)
% tried to threshold to get the area but didan't work
p1=f_dilate(:,1:30);
p2=f_dilate(:,31:60);
p3=f_dilate(:,61:90);
p4=f_dilate(:,91:120);
p5=f_dilate(:,121:150);
p6=f_dilate(:,151:180);
p7=f_dilate(:,181:210);
p8=f_dilate(:,211:240);
p9=f_dilate(:,241:270);
p10=f_dilate(:,271:300);
p11=f_dilate(:,301:330);
p12=f_dilate(:,331:360);
p13=f_dilate(:,361:390);
p14=f_dilate(:,391:420);
p15=f_dilate(:,421:450);
p16=f_dilate(:,451:480);
a1=im2bw(p1,mythresholding(p1));
a2=im2bw(p2,mythresholding(p2));
a3=im2bw(p3,mythresholding(p3));
a4=im2bw(p4,mythresholding(p4));
a5=im2bw(p5,mythresholding(p5));
a6=im2bw(p6,mythresholding(p6));
a7=im2bw(p7,mythresholding(p7));
a8=im2bw(p8,mythresholding(p8));
a9=im2bw(p9,mythresholding(p9));
a10=im2bw(p10,mythresholding(p10));
a11=im2bw(p11,mythresholding(p11));
a12=im2bw(p12,mythresholding(p12));
a13=im2bw(p13,mythresholding(p13));
a14=im2bw(p14,mythresholding(p14));
a15=im2bw(p15,mythresholding(p15));
a16=im2bw(p16,mythresholding(p16));
f_bw = zeros(480,640);
f_bw(:,1:30)=a1;
f_bw(:,31:60)=a2;
f_bw(:,61:90)=a3;
f_bw(:,91:120)=a4;
f_bw(:,121:150)=a5;
f_bw(:,151:180)=a6;
f_bw(:,181:210)=a7;
f_bw(:,211:240)=a8;
f_bw(:,241:270)=a9;   
f_bw(:,271:300)=a10;
f_bw(:,301:330)=a11;
f_bw(:,331:360)=a12;
f_bw(:,361:390)=a13;
f_bw(:,391:420)=a14;
f_bw(:,421:450)=a15;
f_bw(:,451:480)=a16;
[L, num] = bwlabel(f_bw);
frgb = label2rgb(L);
figure,imshow(L);
% I spent 3 days on this question and tried everything ...
%(dilate,erode,open,close and combination of them but didn't work)(sorry
%for submitting it incomplete
