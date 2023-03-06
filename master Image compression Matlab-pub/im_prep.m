%This code reads image file, changes depth of color and pixel of image 
%
%
%
%

% clc;
% clf;
% close all;s
% clear all;
% sprintf('Make sure directory of image file and executing MATLAB script file is same') 
% x=input('enter the file name  ')% return string to x (keep input string inside single quotation mark)
% 
function [R1,G1,B1,R2,G2,B2,RGB,GR,GG,GB,GRGGGB,Gray1,Gray2]=im_prep(x)
try 
    Image=double(imread(x));%image read returns cell containing pixel value, double for large depth color
    imfinfo(x)%displays info of image
   % [Rows, Columns,SamplePerPixel ]=size(Image);%returns number of samples per pixel of image(RGB image consist three sample per pixel for each of R,G and B)
%   if SamplePerPixel==3 && Rows>200 && Columns>200
%         R=double(Image(:,:,1));
%         G=double(Image(:,:,2));
%         B=double(Image(:,:,3)); 
        %Using 200*200 pixel of image to perform image compression
        R1=double(Image(1:200,1:200,1));
        G1=double(Image(1:200,1:200,2));
        B1=double(Image(1:200,1:200,3));
        %conversion to variable uint8(0-255) for displaying and processing
        R2=double(Image(1:200,1:200,1));
        G2=double(Image(1:200,1:200,2));
        B2=double(Image(1:200,1:200,3));
        RGB=cat(3,R2,G2,B2); %concatenate fragment matrix
        %gamma corrected value 
        GR1=(R1.^2.22)*0.001153;
        GG2=(G1.^2.22)*0.001153;
        GB3=(B1.^2.22)*0.001153;
        %conversion to uint8(0-255)for displaying and processing
        GR=GR1;
        GG=GG2;
        GB=GB3;
        GRGGGB=cat(3,GR1,GG2,GB3);
        
   % elseif SamplePerPixel==1 && Rows>200 && Columns>200
%       Gray=double(Image(:,:));
        %Using 200*2000 pixel of image to perform image compression
        %Rec.ITU-R BT.601-7 calculates
        Gray1=0.299 * R1 + 0.587 * G1 + 0.114 * B1;
        Gray2=Gray1;
      
catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n Image file should be RGB or gray scale without pixel less than 200*200 '...
        , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all

end
end 



