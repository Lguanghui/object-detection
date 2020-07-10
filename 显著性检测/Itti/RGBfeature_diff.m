function RGBY=RGBfeature_diff(Rc,Gc,Rs,Gs)
%输入：高分辨率图像红色、绿色特征图，低分辨率图像红色、绿色特征图
%输出：红绿特征取差结果
[m,n]=size(Rc);
Rs=imresize(Rs,[m,n],'nearest');
Gs=imresize(Gs,[m,n],'nearest');
RGBY=abs((double(Rc)-double(Gc))-(double(Gs)-double(Rs)));

%RGBY=uint8(RGBY);