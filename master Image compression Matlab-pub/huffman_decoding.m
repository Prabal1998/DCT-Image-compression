%this code returns mat2dequantize matrix performing decoding using matlab
%huffmandeco function

function [mat2dequantize]=huffman_decoding(huffman_code,huffman_dict,e1,e2)
code_row_vector=huffmandeco(huffman_code,huffman_dict);
mat2dequantize=reshape(code_row_vector,[e2,e1]) ; %reshaping and transposing
