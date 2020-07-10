function img1 = normalizeImg(img)
%输入：待归一化特征图
%输出：归一化特征图
[r,c]=size(img);
m = 0;%动态存储局部最小值
M=1;%全局最大值

img = mat2gray(img);%全局最大值M归一化,并且数值类型转化为double

%寻找局部最大值
step=16;%搜索步长
for i=1:step:r-step
    for j=1:step:c-step
        tempImg=img(i:i+step-1,j:j+step-1);%取块
        m=[m,max(max(tempImg))];
    end
end

%取平均值
[~,cc]=size(m);
sum=0;
for i=1:cc
    sum=sum+m(i);
end
m_=sum/cc;
img1=img+((M-m_)^2);%%%%关键点,.*

% img1=uint8(img);