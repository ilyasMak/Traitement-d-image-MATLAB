function Im=benariserImage(Im,seuil)

Im=rgb2gray(Im) ;
%imshow(Im);
n=size(Im,1);
m=size(Im,2);
for i=1:n 
    for j=1:m
        if (Im(i,j)>seuil)
        Im(i,j)=255 ; 
        else
            Im(i,j)=0 ; 
        end
    end
end
%imshow(Im);

end