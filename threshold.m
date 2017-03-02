I=imread('C:\Users\Morty\Desktop\UCL\Image processing\test_images\girlface.jpg');
L = zeros(size(I));
x=size(I,1);
y=size(I,2);

a=0;
b=0;
tp=0;
tn=0;
T=0;
%L=uint8(L);
%imshow(L);
%ROI = roipoly(I);
%subplot(1,2,1)`
%imshow(I)
%subplot(1,2,2)
%imshow(ROI);
for th=1:255
    FP=0;
    TP=0;
    FN=0;
    TN=0;
    for i=1:x
        for j=1:y
            L(i,j)=(I(i,j) >=th);
        end
    end
    for i=1:x
        for j=1:y
            if(L(i,j)<ROI(i,j))
                FN=FN+1;
            else if(L(i,j)>ROI(i,j))
                    FP=FP+1;
                else if(L(i,j)==0)
                        TN=TN+1;
                    else
                        TP=TP+1;
                    end
                end
            end
        end
    end
    tp(th)=TP;
    tn(th)=TN;
    T(th)=th;
    a(th)=FP/(FP+TN);
    b(th)=TP/(TP+FN);      
end
     plot(T,tp,T,tn);  
