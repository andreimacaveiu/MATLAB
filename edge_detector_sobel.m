kx=[-1 0 1;-2 0 2;-1 0 1];
ky=[-1 -2 -1;0 0 0;1 2 1];
I=imread('C:\Users\Morty\Desktop\UCL\Image processing\test_images\lighthouse.png');
I=double(I);
%imshow(I);

Gx=convol(I,kx);
Gy=convol(I,ky);

theta=atan(Gy./Gx);

G=sqrt(Gx.^2+Gy.^2);

gx=run_theta(Gx,theta);
gy=run_theta(Gy,theta);

g=sqrt(gx.^2+gy.^2);
subplot(1,3,3);
g=uint8(g);
imshow(g);
subplot(1,3,2);
G=uint8(G);
imshow(G);

Gx=uint8(Gx);
subplot(1,3,1);
imshow(Gx);

Gy=uint8(Gy);
%subplot(1,3,2);
imshow(Gy);


function R= run_theta(I,theta)
R=zeros(size(I));
for x=2:size(I,1)-1
    for y=2:size(I,2)-1
        aux=theta(x,y);
        
        if(aux>=-0.3927 && aux<=0.3927)
            if(I(x,y)>I(x,y-1) && I(x,y)>I(x,y+1) && I)
                R(x,y)=1;
            end
        end
        
        if(aux>0.3927 && aux<=1.1781)
            if(I(x,y)>I(x-1,y+1) && I(x,y)>I(x+1,y-1))
                R(x,y)=1;
            end
        end
        
        if(aux<-0.3927 && aux>=-1.1781)
            if(I(x,y)>I(x-1,y-1) && I(x,y)>I(x+1,y+1))
                R(x,y)=1;
            end
        end
        
         if((aux>1.1781 && aux<=1.5708)||(aux<-1.1781 && aux>=-1.5708))
            if(I(x,y)>I(x-1,y) && I(x,y)>I(x+1,y))
                R(x,y)=1;
            end
         end
             
    end
end
end


function Ip= convol(I,k)
for x=1:size(I,1)
    for y=1:size(I,2)
        Ip(x,y)=0;
        for i=-1:size(k,1)-2
            for j=-1:size(k,2)-2
                if x-i==0 || x-i==size(I,1)+1
                    c1=x;
                else
                    c1=x-i;
                end
                if y-j==0 || y-j==size(I,2)+1
                    c2=y;
                else
                    c2=y-j;
                end
                Ip(x,y)= Ip(x,y)+k(i+2,j+2)*I(c1,c2);
            end
        end
    end
end
end