%Image color space transform YUV, YIQ, YCbCr,CIE 1931 
%Here assuming gamma correction K.^(2.222)*(4.4888e-06)
%
%
%conversion to Y,Cb,Cr forward transform
 function[Y2,Cb,Cr,Y3CbCr]=color_spc_for_ycbcrrgb(R2,G2,B2)
    try
        Y2=0.257*R2+0.504*G2+0.098*B2+16;
        Cb=-0.148*R2-0.291*G2+0.439*B2+128;
        Cr=0.439*R2-0.368*G2-0.071*B2+128;
        Y3CbCr=cat(3,Y2,Cb,Cr);
    
    catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n forward transform RGB to YUV failure '...
    , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all
    end
 end

