function R=extract_Rfeature(img)
% ���룺����ȡͼ��
% �������ɫR����
R=img(:,:,1)-((img(:,:,2)+img(:,:,3))./2);

% R=uint8(R);