function img1 = normalizeImg(img)
%���룺����һ������ͼ
%�������һ������ͼ
[r,c]=size(img);
m = 0;%��̬�洢�ֲ���Сֵ
M=1;%ȫ�����ֵ

img = mat2gray(img);%ȫ�����ֵM��һ��,������ֵ����ת��Ϊdouble

%Ѱ�Ҿֲ����ֵ
step=16;%��������
for i=1:step:r-step
    for j=1:step:c-step
        tempImg=img(i:i+step-1,j:j+step-1);%ȡ��
        m=[m,max(max(tempImg))];
    end
end

%ȡƽ��ֵ
[~,cc]=size(m);
sum=0;
for i=1:cc
    sum=sum+m(i);
end
m_=sum/cc;
img1=img+((M-m_)^2);%%%%�ؼ���,.*

% img1=uint8(img);