function B=extract_Bfeature(img)
% ���룺����ȡͼ��
% �������ɫB����
B=img(:,:,3)-((img(:,:,1)+img(:,:,2))./2);

% B=uint8(B);