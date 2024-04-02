function compt=Taille_compresser(im)

im=rgb2gray(im); 
[n,m]=size(im);
im=im' ; 
nb=1 ; 
k=1 ; 
  for i=1:n*m-1
        if im(i)==im(i+1)
            nb=nb+1 ; 
            p(k)=nb; 
            p(k+1)=im(i); 
        
       else 
            k=k+2 ; 
            nb=1 ; 
            p(k)=nb; 
            p(k+1)=im(i+1); 
       end
        

  end
  compt=length(p);
end