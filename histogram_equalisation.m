%function [cd]= c_distrib(p_dens)
 %   cd=zeros(1,256);
clear all; 
img=imread('C:\Users\Morty\Desktop\UCL\Image processing\test_images\Lenna.png');
img=rgb2gray(img);
val=zeros(1,256);
h=size(img,1);
w=size(img,2);
for i=1:h
    for j=1:w
        x=img(i,j);
        val(x)=val(x)+1;
    end
end

cd=zeros(1,256);
cd(1)=val(1);
for i=2:256
    cd(i)=val(i)+cd(i-1);
end
%cd=cd/cd(256);
for i=1:256
    if(cd(i)>0)
        cd_min=cd(i);
        break;
    end
end
img_eq=zeros(size(img));
for i=1:h
    for j=1:w
        x=img(i,j);
        img_eq(i,j)=((cd(x)-cd_min)/(w*h-cd_min))*255;
    end
end
img_eq=uint8(img_eq);
subplot(1,2,1);
imshow(img);
title('Original');
subplot(1,2,2);
imshow(img_eq);
title('Histogram equalized');