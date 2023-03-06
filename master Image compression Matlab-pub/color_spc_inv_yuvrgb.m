%Image color space transform YUV, YIQ, YCbCr,CIE 1931 
%Here assuming gamma correction K.^(2.222)*(4.4888e-06)
%
%conversion  Y,U,V to R,G,B inverse transform

function[R3,G3,B3,YUV2RGB]=color_spc_inv_yuvrgb(Y,U,V)
try
    %Inverse transform
    R3=Y+1.140*V;
    G3=Y-0.395*U-0.581*V;
    B3=Y+2.032*U;
    YUV2RGB=cat(3,R3,G3,B3);
 
   
catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n  Inverse transform YUV to RGB failure  '...
    , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all
end
end

