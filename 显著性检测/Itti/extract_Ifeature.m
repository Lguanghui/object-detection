function I=extract_Ifeature(img)
% ���룺����ȡͼ��
% �������������ͼ
I=(img(:,:,1)+img(:,:,2)+img(:,:,3))./3;

% I=uint8(I);