function [dct1d_inv]=dct1d_inv2(var_mat)
try
    process_matrix1=var_mat;
    column_size=size(process_matrix1,1);
    sum=0;
    dct1d_inv=zeros(1,column_size);  
    for u=0:column_size-1
        for v=0:column_size-1
             if v==0
                K=sqrt(1/column_size);
        else
                K=sqrt(2/column_size);
        end
            sum=sum+K.*(process_matrix1(v+1).*(cos((pi.*(2.*u+1).*v)/(2*column_size))));
        end
       dct1d_inv(u+1)=sum;
       sum=0;
    end
    dct1d_inv;
catch ME
    
   sprintf('error while performing column wise DCT') 
end
end


