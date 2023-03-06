%dwt_2d_rev
%this function performs inverse discrete wavelet transform
function [mat2disp]= dwt2d_inv(single_matrix,DWT,S)
mat2disp=waverec2(DWT,S,'haar')
end