function [dct1d]=dct1d_for1(row_mat)
try 
    process_matrix1=row_mat;
    row_size=size(row_mat,2);
    sum=0;
    dct1d=zeros(1,row_size);  
    for l=0:row_size-1
        for m=0:row_size-1
            sum=sum+process_matrix1(m+1).*(cos((pi.*(2.*m+1).*l)/(2*row_size)));
        end
        if l==0
                K=sqrt(1/row_size);
        else
                K=sqrt(2/row_size);
        end

       dct1d(l+1)=K.*sum;
       sum=0;
    end
    dct1d;
catch ME
    
    sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n Image file should be RGB or gray scale without pixel less than 640*640 '...
        , ME.stack(1).name, ME.stack(1).line, ME.message')
end
end


