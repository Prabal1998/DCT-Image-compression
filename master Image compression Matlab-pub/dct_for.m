y=[1,2,3];
[M,N]=size(y);
sum=0;
dct1d=zeros(1,N);
u=[0:N-1] ; 
for j=0:N-1
    for i=0:N-1
        sum=sum+y(i+1).*(cos((pi.*(2.*i+1).*j)/(2*N)));
    end
    if j==0   
            K=sqrt(1/N);
    else
            K=sqrt(2/N);
    end

   dct1d(j+1)=K.*sum;
   sum=0;
end
dct1d;


