%this code converts 2D matrix to a single row matrix
function [plot_row_mat]=dct2d_mat2_row_mat(image_matrix,up2pixel)
try
    plot_resize=(image_matrix(1:up2pixel,:));
    plot_resize_transpose=transpose(plot_resize);
    plot_row_mat=reshape(plot_resize_transpose,[1,size(image_matrix,2)*up2pixel]);
    
    catch ME
    warning('error at dct2d_mat2_row_mat');
    
end
end
