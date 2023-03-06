% DCT of all blocks returning to single matrix mat2encode
function [mat2disp,blks1]=DCT_2D_inv(single_matrix,blk_size,blks,blks1)
try
    matrix_size=size(single_matrix,1);
    num_blks=matrix_size/blk_size;
    for p=1:num_blks
        for q=1:num_blks
            new_blk=blks{p,q};
        blks1{p,q}=dct2d_inv_ablk(new_blk,blk_size); 
        end 
    end
    mat2disp=cell2mat(blks1);
catch ME
  sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n Image file should be RGB or gray scale without pixel less than 640*640 '...
        , ME.stack(1).name, ME.stack(1).line, ME.message)
end
end
