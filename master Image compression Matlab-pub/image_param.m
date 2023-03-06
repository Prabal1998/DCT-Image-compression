%calculation of MSE, PSNR, CR
%Calculation of mean square error of input matrix and mat2disp
function [mnsqer,psnr]= image_param(mat2disp,image_matrix)
 inst=input('enter the input image maximum intensity value: ');

[M,N]=size(image_matrix);
%mean square error
   sq_er=0;
    for u=1:M
        for v=1:N
            sq_er=sq_er+(image_matrix(u,v)-mat2disp(u,v)).^2;
        end
      
    end
    %mean square error
    mnsqer=sq_er/(M*N);
    %psnr calculation in dB
   
    calc=((inst)^2)/mnsqer;
    psnr=10*(log10(calc));
    
    disp('-----mean square error---');
    disp(mnsqer);
    disp('---Peak signal to noise ratio---');
    disp(psnr);
    
  % writing the output to specific file directory to find compression ratio
  % MATLAB doesn't show actual file size
  cd 'Input output CR'
  str_dir=input('enter the input image file name inside single quotation: ');
  image_matrix_scl=uint8(image_matrix);
  imwrite(image_matrix_scl,str_dir,'tiff');
  
  str_dir=input('enter the output image file name inside single quotation: ');
  mat2disp_scl=uint8(mat2disp);
  imwrite(mat2disp_scl,str_dir,'tiff'); 
  cd '../'
  
  %output dictionary and code and quantization matrix to be done and
  %included
  
    
end
    
    
    
