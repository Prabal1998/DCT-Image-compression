%Image color space transform YUV, YIQ, YCbCr,CIE 1931 
%Here assuming gamma correction K.^(2.222)*(4.4888e-06)
%
%
%conversion to RGB from YIQ inverse transform
 function[R4,G4,B4,Y1IQ2RGB]=color_spc_inv_yiqrgb(Y1,I,Q)
    try
        R4=Y1+0.956*I+0.621*Q;
        G4=Y1-0.272*I-0.647*Q;
        B4=Y1-1.107*I+1.704*Q;
        Y1IQ2RGB=cat(3,R4,G4,B4);
    
    catch ME
        error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n forward transform RGB to YUV failure '...
        , ME.stack(1).name, ME.stack(1).line, ME.message)

   close all
    end
 end

