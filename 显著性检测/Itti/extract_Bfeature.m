function B=extract_Bfeature(img)
% 输入：待提取图像
% 输出：蓝色B特征
B=img(:,:,3)-((img(:,:,1)+img(:,:,2))./2);

% B=uint8(B);