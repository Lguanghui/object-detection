function I_cs=Ifeature_diff(I1,I2)
% 输入：I1为高分辨率图像，I2为低分辨率图像
% 输出：亮度特征取差结果
[m,n]=size(I1);
I2=imresize(I2,[m,n],'nearest');
I_cs=abs(double(I1)-double(I2));

%I_cs=uint8(I_cs);