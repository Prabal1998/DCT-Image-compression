%2d level 2 dwt forward 
% 2-level 2D DWT
function [mat2quant,DWT,S]=dwt2d_for(single_matrix)
%displays filter coefficients

%[FC1,FC2]=wfitlers(haar,'d')%d-->decomposition, r-->reconstruction, l-->low pass, h-->high pass
[DWT,S] = wavedec2(single_matrix,2,'haar');
% arramat2quant to store all DWT coefficients for display
mat2quant = zeros(2*S(1,1)+S(2,1),2*S(1,2)+S(2,2));

% Extract approximation & detail coefficients @ level 2 and
% Place them in the large single arramat2quant mat2quant for display
LL2 = appcoef2(DWT,S,2,'haar');
[HL2,LH2,HH2] = detcoef2('all',DWT,S,2);
mat2quant(1:S(1,1),1:S(1,2)) = LL2;
mat2quant(1:S(1,1),S(1,2)+1:2*S(1,2)) = HL2;
mat2quant(S(1,1)+1:2*S(1,1),1:S(1,2)) = LH2;
mat2quant(S(1,1)+1:2*S(1,1),S(1,2)+1:2*S(1,2)) = HH2;
% Now extract detail coefficients @ level 1 and
% Place them in the large single array mat2quant for display
[HL1,LH1,HH1] = detcoef2('all',DWT,S,1);
mat2quant(1:S(3,1),2*S(1,2)+1:2*S(1,2)+S(3,2)) = HL1;
mat2quant(2*S(1,1)+1:2*S(1,1)+S(3,1),1:S(3,2)) = LH1;
mat2quant(2*S(1,1)+1:2*S(1,1)+S(3,1),2*S(1,2)+1:2*S(1,2)+S(3,2)) = HH1;
% use wcodemat for visual enhancement
figure(10)
imshow(wcodemat(mat2quant,32,'m',1),[]);
% figure(11)
% imshow(uint8(mat2quant))
title('2-Level 2D DWT')
