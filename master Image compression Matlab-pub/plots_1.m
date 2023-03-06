%some plots
%converts DCT coefficient to gray scale image and displays
%histogram plot 
function [dct_img,plot_hist,plot_amp]=plots_1(mat2quant,image_matrix,up2pixel)
dct_img=mat2gray(mat2quant);
figure(8);
imshow(dct_img);

plot_row_mat=dct2d_mat2_row_mat(image_matrix,up2pixel);
figure(9);
subplot(2,1,1);
plot_hist=histogram(plot_row_mat);


plot_row_mat=dct2d_mat2_row_mat(image_matrix,up2pixel);

subplot(2,1,2);
plot_amp=plot([1:size(image_matrix,2)*up2pixel],[plot_row_mat]);

end










