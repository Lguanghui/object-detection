function I_cs=Ifeature_diff(I1,I2)
% ���룺I1Ϊ�߷ֱ���ͼ��I2Ϊ�ͷֱ���ͼ��
% �������������ȡ����
[m,n]=size(I1);
I2=imresize(I2,[m,n],'nearest');
I_cs=abs(double(I1)-double(I2));

%I_cs=uint8(I_cs);