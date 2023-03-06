%This function performs segmenting picture into block size of N*N pixel
%

%c = mat2cell(x,m,n) divides up the two-dimensional matrix...
%x into adjacent submatrices, each contained in a cell of the...
%returned cell array, c. Vectors m and n specify the number of...
%rows and columns, respectively, to be assigned to the submatrices in c...
%
%
%
function [blks,blks1]=block(single_matrix,blk_size)
try
    %number of rows
    r=size(single_matrix,1);
    %number of columns
    c=size(single_matrix,2);
    num_blk1=r/blk_size;
    num_blk2=c/blk_size;
    %creating a random matrix of zeros to store 
    p=zeros(1,num_blk1);
    q=zeros(1,num_blk2);
    for i=1:num_blk1
        p(i)=[blk_size];
    end
    for i=1:num_blk2
        q(i)=[blk_size];
    end
    %new matrix X dividing image into block size of N*N pixel
    blks=mat2cell(single_matrix,p,q);
    blks1=mat2cell(single_matrix,p,q);
    
    
catch ME
    error=sprintf('Check \n Function: %s \n At line: %d \n Possible cause:%s \n no of rows or column divide by block size should return 0 remainder'...
        , ME.stack(1).name, ME.stack(1).line, ME.message)
  
   close all
end
end





