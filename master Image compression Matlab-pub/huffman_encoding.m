%huffman encoding using matlab default function huffmandict, huffmanenco

function [e1,e2,huffman_dict,huffman_code]=huffman_encoding(mat2encode,maxm,minm)
[e1,e2]=size(mat2encode);
row_vector=reshape(mat2encode,[1,e1*e2]);
[M1,N1]=size(row_vector);
tot_num=M1*N1; 
freq=0;
%temp_prob=0;
count=1;
prob=0;
for i=minm:maxm 
    true_mat=mat2encode==i;
    freq(count)=sum(true_mat(:));
    prob(count)=freq(count)/tot_num;
    count=count+1;
%     temp_prob(count)=temp_prob+prob(count);
%     temp_prob_cum(count)=temp_prob(count);
end
symbols=[minm:maxm];

%deleting symbol with exisitng probability 0 to reduce dict size
rem_prob=find(prob~=0);
prob=prob(rem_prob);
symbols=symbols(rem_prob);
%creating huffman dict using matlab default function huffmandict. It uses
%maximum variance algorithm using SYM vector.
huffman_dict=huffmandict(symbols,prob);
%huffman encoding
huffman_code=huffmanenco(row_vector,huffman_dict);

