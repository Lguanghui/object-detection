function Y=extract_Yfeature(img)
% ���룺����ȡͼ��
% �������ɫY����
Y=img(:,:,1)+img(:,:,2)-((abs(img(:,:,1)-img(:,:,2))+img(:,:,3)).*2);

% Y=uint8(Y);