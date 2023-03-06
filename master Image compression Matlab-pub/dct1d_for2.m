function [dct1d]=dct1d_for2(var_mat)
try
    process_matrix1=var_mat;
    column_size=size(process_matrix1,1);
    sum=0;
    dct1d=zeros(1,column_size);  
    for u=0:column_size-1
        for v=0:column_size-1
            sum=sum+process_matrix1(v+1).*(cos((pi.*(2.*v+1).*u)/(2*column_size)));
        end
        if u==0
                K=sqrt(1/column_size);
        else
                K=sqrt(2/column_size);
        end

       dct1d(u+1)=K.*sum;
       sum=0;
    end
    dct1d;
catch ME
    
   sprintf('error while performing column wise DCT') 
end
end


