function G=extract_Gfeature(img)
% ���룺����ȡͼ��
% �������ɫG����ͼ
G=img(:,:,2)-((img(:,:,1)+img(:,:,3))./2);

% G=uint8(G);