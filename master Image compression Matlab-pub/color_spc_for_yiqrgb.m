%Image color space transform YUV, YIQ, YCbCr,CIE 1931 
%Here assuming gamma correction K.^(2.222)*(4.4888e-06)
%
%
%conversion to Y,I,Q forward transform
 function[Y1,I,Q,Y1IQ]=color_spc_for_yiqrgb(R2,G2,B2)
    try
        Y1=0.299*R2+0.587*G2+0.114*B2;
        I=0.596*R2-0.275*G2-0.321*B2;
        Q=0.212*R2-0.523*G2+0.311*B2;
    
    Y1IQ=cat(3,Y1,I,Q);
    
    catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n forward transform RGB to YUV failure '...
    , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all
    end
 end

