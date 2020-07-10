function I=extract_Ifeature(img)
% 输入：待提取图像
% 输出：亮度特征图
I=(img(:,:,1)+img(:,:,2)+img(:,:,3))./3;

% I=uint8(I);