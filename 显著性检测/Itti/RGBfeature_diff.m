function RGBY=RGBfeature_diff(Rc,Gc,Rs,Gs)
%���룺�߷ֱ���ͼ���ɫ����ɫ����ͼ���ͷֱ���ͼ���ɫ����ɫ����ͼ
%�������������ȡ����
[m,n]=size(Rc);
Rs=imresize(Rs,[m,n],'nearest');
Gs=imresize(Gs,[m,n],'nearest');
RGBY=abs((double(Rc)-double(Gc))-(double(Gs)-double(Rs)));

%RGBY=uint8(RGBY);