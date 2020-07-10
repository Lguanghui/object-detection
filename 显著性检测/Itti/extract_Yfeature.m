function Y=extract_Yfeature(img)
% 输入：待提取图像
% 输出：黄色Y特征
Y=img(:,:,1)+img(:,:,2)-((abs(img(:,:,1)-img(:,:,2))+img(:,:,3)).*2);

% Y=uint8(Y);