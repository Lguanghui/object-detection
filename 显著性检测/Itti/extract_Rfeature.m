function R=extract_Rfeature(img)
% 输入：待提取图像
% 输出：红色R特征
R=img(:,:,1)-((img(:,:,2)+img(:,:,3))./2);

% R=uint8(R);