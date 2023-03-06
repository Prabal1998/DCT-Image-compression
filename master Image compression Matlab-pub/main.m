
clc
clf
close all
clear all
sprintf('Make sure directory of image file and executing MATLAB script file is same: ') 
x=input('enter the file name, input string inside single quotation mark:  ')% returns string to x
%Image=double(imread(x));
imfinfo(x)
%Gray1=double(Image(1:200,1:200));

%[Gray1]=im_prep(x);
[R1,G1,B1,R2,G2,B2,RGB,GR,GG,GB,GRGGGB,Gray1,Gray2]=im_prep(x);
figure(1)
%%displays original RGB image
imshow(uint8(RGB));
%imshow(uint8(Gray1))

% %forward conversion from RGB original image to YUV and display
 [Y,U,V,YUV]=color_spc_for_yubrgb(R2,G2,B2);
figure(2)
imshow(uint8(YUV));

% %inverse transform from YUV to RGB and display
[R3,G3,B3,YUV2RGB]=color_spc_inv_yuvrgb(Y,U,V);
 figure(3)
 imshow(uint8(YUV2RGB));

% %forward transform from RGB original image to YIQ and display
 [Y1,I,Q,Y1IQ]=color_spc_for_yiqrgb(R2,G2,B2);
 figure(4)
imshow(uint8(Y1IQ));
% %inverse transform from YIQ to RGB and display
 [R4,G4,B4,Y1IQ2RGB]=color_spc_inv_yiqrgb(Y1,I,Q);
 figure(5)
 imshow(uint8(Y1IQ2RGB));
% %forward conversion from RGB original image to YCbCr and display
 [Y2,Cb,Cr,Y2CbCr]=color_spc_for_ycbcrrgb(R2,G2,B2);
figure(6)
 imshow(uint8(Y2CbCr));
% %inverse conversion from YCbCr to RGB and display
 [R5,G5,B5,Y2CbCr2RGB]=color_spc_inv_ycbcrrgb(Y2,Cb,Cr);
 figure(7)
 imshow(uint8(Y2CbCr2RGB));

 %Gamma corrected Image
 figure(8)
 imshow(uint8(GRGGGB))

%image splitting into block of N*N
sprintf('-----------Splitting matrix into block of N*N pixel---------- ');
single_matrix=input('Select either of matrix from: R1,G1,B1,Y,U,V,Y2,Cb,Cr,Y1,I,Q,Gray1,Gray2:  ');
blk_size=input('enter block size N representing N*N pixel: ');

[blks,blks1]=block(single_matrix,blk_size);
%DCT of input image and returns value to a single matrix mat2quant
[mat2quant,blks1]=DCT_2D_for(single_matrix,blk_size,blks,blks1);

image_matrix=input('select input image matrix existing in workspace to plot: ');
up2pixel=input('enter the number of row to plot intensity value of pixel element consisting along rows: ');
plot_hist=plots_1(mat2quant,image_matrix,up2pixel);
plot_amp=plots_1(mat2quant,image_matrix,up2pixel);
hold on;
%some plots of DCT coefficient matrix
clear image_matrix;
image_matrix=input('select dct matrix to plot: ');
plot_hist=plots_1(mat2quant,image_matrix,up2pixel);
plot_amp=plots_1(mat2quant,image_matrix,up2pixel);

%scaling the content to represent by small magnitude
scal_f=input('Enter the scaling factor f that is  divisor to the DCT coefficient:  ')
pos_off=input('Enter the offset value to be applied to DCT coefficient: ')
mat2quant_pos_off=mat2quant + abs(pos_off)+1;
mat2quant_scal_f=(mat2quant_pos_off./scal_f);
%permanent quantization and dequantization is not used
[mat2encode,distor,rel_distor]=llyod_quant(mat2quant_scal_f);
%finding maximum and minimum value of mat2encode;
maxm=max(max(mat2encode));
minm=min(min(mat2encode));
[e1,e2,huffman_dict,huffman_code]=huffman_encoding(mat2encode,maxm,minm);
%
huff_ipmatrix=input('select input image matrix existing in workspace to write input image in binary format \n : ');
%output the line encoded and write the compressed output
[huffman_dict_disk_adapt,huffman_code_disk_adapt]=compressed_output(huffman_dict, huffman_code, huff_ipmatrix);


%Decoding using huffman decoder
mat2dequantize=huffman_decoding(huffman_code,huffman_dict,e1,e2);

% rescaling and reoffeset/ dequantization
mat2inv=((mat2dequantize.*scal_f)-abs(pos_off)-1);
%inverse DCT 
clear single_matrix;
single_matrix=input('Select mat2inv matrix existing in workspace to perform inverse DCT/DWT:   ');
blk_size=input('enter block size N representing N*N pixel to perform inverse DCT/DWT:  ');

clear blks && blks1;
[blks,blks1]=block(single_matrix,blk_size);
[mat2disp,blks1]=DCT_2D_inv(single_matrix,blk_size,blks,blks1);
%[mat2disp]= dwt2d_inv(single_matrix,DWT,S);

%parameter value returning function and return compresion file to specific
%directory
single_matrix=input('Select either of matrix from: R1,G1,B1,Y,U,V,Y2,Cb,Cr,Y1,I,Q,Gray1,Gray2:  ');
[mnsqer,psnr]= image_param(mat2disp,single_matrix);
figure(11)
imshow(uint8(mat2disp));
