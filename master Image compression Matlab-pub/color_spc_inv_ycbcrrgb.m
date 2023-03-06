%Image color space transform YUV, YIQ, YCbCr,CIE 1931 
%Here assuming gamma correction K.^(2.222)*(4.4888e-06)
%
%
%conversion to Y,Cb,Cr inverse transform
 function[R5,G5,B5,Y2CbCr2RGB]=color_spc_inv_ycbcrrgb(Y2,Cb,Cr)
    try
        R5=1.164*(Y2-16)+1.596*(Cr-128);
        G5=1.164*(Y2-16)-0.813*(Cr-128)-0.391*(Cb-128);
        B5=1.164*(Y2-16)+2.018*(Cb-128);
        Y2CbCr2RGB=cat(3,R5,G5,B5);
    
    catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n forward transform RGB to YUV failure '...
    , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all
    end
 end

