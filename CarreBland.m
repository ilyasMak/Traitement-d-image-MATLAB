function im1= CarreBland(img)

%-----------------------------  
im1=img ; 
for i=206:306
    for j=206:306 
        im1(i,j,1)=255 ; %images
        im1(i,j,2)=255 ;
        im1(i,j,3)=255 ;
    end
end
%imshow(im1);
end