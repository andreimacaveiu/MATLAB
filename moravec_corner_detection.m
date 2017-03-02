I=imread('C:\Users\Morty\Desktop\UCL\Image processing\week_08\building.png');
n=size(I,1);
m=size(I,2);
I2=zeros(n,m);
I=im2double(I);
for x=2:n-1
    for y=2:m-1
        min=255;
        d=0;
        for i=-1:1
               for j=-1:1
                  d=d+((I(x+i,y+j)-I(x,y))^2);
               end
        end
         
                  if(d<min)
                      min=d;
                 
                   end
           I2(x,y)=min;
    end
end
%I2=uint8(I2);
subplot(1,2,1);
imshow(I);
title('Original');
subplot(1,2,2);
imshow(I2);
title('Edge detect');