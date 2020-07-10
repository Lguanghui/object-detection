function G=extract_Gfeature(img)
% 输入：待提取图像
% 输出：绿色G特征图
G=img(:,:,2)-((img(:,:,1)+img(:,:,3))./2);

% G=uint8(G);