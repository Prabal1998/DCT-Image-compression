%This code returns 2D DCT matrix performing
%row after column wise 1D DCT operation of a block of size N*N pixel 
%
%
%
%

function [dct2d_mat_ablk]=dct2d_for_ablk(new_blk,blk_size)
try
    %new_blk=blks{k1,k2}
    %creating a variable (zero matrix) to store values
    var_mat=zeros(blk_size) ;
    %returns row wise operation calling function dct1d_for which
    %performs 1D DCT along row
    for i=1:blk_size
        row_mat=new_blk(i,:);
       var_mat(i,:)=dct1d_for1(row_mat);
    end
    %returns column wise operation calling function dct1d_for which
    %performs 1D DCT of resultig row. 
    for i=1:blk_size
        var_mat(:,i)=dct1d_for2(var_mat(:,i));
    end
    dct2d_mat_ablk=var_mat;
catch ME
    sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n Image file should be RGB or gray scale without pixel less than 640*640 '...
        , ME.stack(1).name, ME.stack(1).line, ME.message')
     
end
end

    