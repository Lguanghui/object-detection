%%读取图像
path1='/Users/yunyi/Desktop/testimg/object_detectEX/EX4/images/0010.jpg';
path2='/Users/yunyi/Desktop/testimg/object_detectEX/EX4/ittiResult/0010.jpg';
img1=imread(path1);
%img1=rgb2gray(img1);
[m,n,c]=size(img1);%长宽及通道
img1=im2double(img1);
%%
%%底层空间特征图，生成金字塔图像

%得到金字塔图像
w=fspecial('gaussian',[3 3]);
img2=imresize(imfilter(img1,w),[m/2 n/2]);
img3=imresize(imfilter(img2,w),[m/4 n/4]);
img4=imresize(imfilter(img3,w),[m/8 n/8]);
img5=imresize(imfilter(img4,w),[m/16 n/16]);
img6=imresize(imfilter(img5,w),[m/32 n/32]);
img7=imresize(imfilter(img6,w),[m/64 n/64]);
img8=imresize(imfilter(img7,w),[m/128 n/128]);
img9=imresize(imfilter(img8,w),[m/256 n/256]);
figure('Name','九层金字塔图像'),
subplot 331,imshow(img1);
subplot 332,imshow(img2);
subplot 333,imshow(img3);
subplot 334,imshow(img4);
subplot 335,imshow(img5);
subplot 336,imshow(img6);
subplot 337,imshow(img7);
subplot 338,imshow(img8);
subplot 339,imshow(img9);


%亮度金字塔
I1=extract_Ifeature(img1);
I2=extract_Ifeature(img2);
I3=extract_Ifeature(img3);
I4=extract_Ifeature(img4);
I5=extract_Ifeature(img5);
I6=extract_Ifeature(img6);
I7=extract_Ifeature(img7);
I8=extract_Ifeature(img8);
I9=extract_Ifeature(img9);
% figure,
% imshow(I2);


%色度金字塔
%红色特征
R1=extract_Rfeature(img1);
R2=extract_Rfeature(img2);
R3=extract_Rfeature(img3);
R4=extract_Rfeature(img4);
R5=extract_Rfeature(img5);
R6=extract_Rfeature(img6);
R7=extract_Rfeature(img7);
R8=extract_Rfeature(img8);
R9=extract_Rfeature(img9);
% figure,
% imshow(R1);

%绿色特征
G1=extract_Gfeature(img1);
G2=extract_Gfeature(img2);
G3=extract_Gfeature(img3);
G4=extract_Gfeature(img4);
G5=extract_Gfeature(img5);
G6=extract_Gfeature(img6);
G7=extract_Gfeature(img7);
G8=extract_Gfeature(img8);
G9=extract_Gfeature(img9);
% figure,
% imshow(G1);

%蓝色特征
B1=extract_Bfeature(img1);
B2=extract_Bfeature(img2);
B3=extract_Bfeature(img3);
B4=extract_Bfeature(img4);
B5=extract_Bfeature(img5);
B6=extract_Bfeature(img6);
B7=extract_Bfeature(img7);
B8=extract_Bfeature(img8);
B9=extract_Bfeature(img9);
% figure,
% imshow(B1);

%黄色特征
Y1=extract_Yfeature(img1);
Y2=extract_Yfeature(img2);
Y3=extract_Yfeature(img3);
Y4=extract_Yfeature(img4);
Y5=extract_Yfeature(img5);
Y6=extract_Yfeature(img6);
Y7=extract_Yfeature(img7);
Y8=extract_Yfeature(img8);
Y9=extract_Yfeature(img9);
% figure,
%imshow(Y1);


%方向特征
%使用内置gabor滤波器
gaborArray = gabor(3,[0 45 90 135]);%滤波器数组，波长为10，四个方向
img1_gaborMag=imgaborfilt(rgb2gray(img1),gaborArray);%结果包含四个方向的特征图，在第三维度
img2_gaborMag=imgaborfilt(rgb2gray(img2),gaborArray);
img3_gaborMag=imgaborfilt(rgb2gray(img3),gaborArray);
img4_gaborMag=imgaborfilt(rgb2gray(img4),gaborArray);
img5_gaborMag=imgaborfilt(rgb2gray(img5),gaborArray);
img6_gaborMag=imgaborfilt(rgb2gray(img6),gaborArray);
img7_gaborMag=imgaborfilt(rgb2gray(img7),gaborArray);
img8_gaborMag=imgaborfilt(rgb2gray(img8),gaborArray);
img9_gaborMag=imgaborfilt(rgb2gray(img9),gaborArray);
figure('Name',"原图的 Gabor 特征图（四个方向）")
for i=1:4
    subplot(2,2,i),imshow(img1_gaborMag(:,:,i),[]);
    theta = gaborArray(i).Orientation;
    lambda = gaborArray(i).Wavelength;
    title(sprintf('方向=%d, 波长=%d',theta,lambda));
end


%%
%%计算显著图,分辨率以函数中最大的分辨率为标准
%亮度特征取差
I_2_5=double(Ifeature_diff(I2,I5));
I_2_6=double(Ifeature_diff(I2,I6));
I_3_6=double(Ifeature_diff(I3,I6));
I_3_7=double(Ifeature_diff(I3,I7));
I_4_7=double(Ifeature_diff(I4,I7));
I_4_8=double(Ifeature_diff(I4,I8));

%色度特征取差
%RG
RG_2_5=double(RGBfeature_diff(R2,G2,R5,G5));
RG_2_6=double(RGBfeature_diff(R2,G2,R6,G6));
RG_3_6=double(RGBfeature_diff(R3,G3,R6,G6));
RG_3_7=double(RGBfeature_diff(R3,G3,R7,G7));
RG_4_7=double(RGBfeature_diff(R4,G4,R7,G7));
RG_4_8=double(RGBfeature_diff(R4,G4,R8,G8));

%BY
BY_2_5=double(RGBfeature_diff(B2,B2,Y5,Y5));
BY_2_6=double(RGBfeature_diff(B2,B2,Y6,Y6));
BY_3_6=double(RGBfeature_diff(B3,B3,Y6,Y6));
BY_3_7=double(RGBfeature_diff(B3,B3,Y7,Y7));
BY_4_7=double(RGBfeature_diff(B4,B4,Y7,Y7));
BY_4_8=double(RGBfeature_diff(B4,B4,Y8,Y8));

%方向特征取差
%0度
O_2_5_0=double(directionfeature_diff(img2_gaborMag(:,:,1),img5_gaborMag(:,:,1)));
O_2_6_0=double(directionfeature_diff(img2_gaborMag(:,:,1),img6_gaborMag(:,:,1)));
O_3_6_0=double(directionfeature_diff(img3_gaborMag(:,:,1),img6_gaborMag(:,:,1)));
O_3_7_0=double(directionfeature_diff(img3_gaborMag(:,:,1),img7_gaborMag(:,:,1)));
O_4_7_0=double(directionfeature_diff(img4_gaborMag(:,:,1),img7_gaborMag(:,:,1)));
O_4_8_0=double(directionfeature_diff(img4_gaborMag(:,:,1),img8_gaborMag(:,:,1)));

%45度
O_2_5_45=double(directionfeature_diff(img2_gaborMag(:,:,2),img5_gaborMag(:,:,2)));
O_2_6_45=double(directionfeature_diff(img2_gaborMag(:,:,2),img6_gaborMag(:,:,2)));
O_3_6_45=double(directionfeature_diff(img3_gaborMag(:,:,2),img6_gaborMag(:,:,2)));
O_3_7_45=double(directionfeature_diff(img3_gaborMag(:,:,2),img7_gaborMag(:,:,2)));
O_4_7_45=double(directionfeature_diff(img4_gaborMag(:,:,2),img7_gaborMag(:,:,2)));
O_4_8_45=double(directionfeature_diff(img4_gaborMag(:,:,2),img8_gaborMag(:,:,2)));

%90度
O_2_5_90=double(directionfeature_diff(img2_gaborMag(:,:,3),img5_gaborMag(:,:,3)));
O_2_6_90=double(directionfeature_diff(img2_gaborMag(:,:,3),img6_gaborMag(:,:,3)));
O_3_6_90=double(directionfeature_diff(img3_gaborMag(:,:,3),img6_gaborMag(:,:,3)));
O_3_7_90=double(directionfeature_diff(img3_gaborMag(:,:,3),img7_gaborMag(:,:,3)));
O_4_7_90=double(directionfeature_diff(img4_gaborMag(:,:,3),img7_gaborMag(:,:,3)));
O_4_8_90=double(directionfeature_diff(img4_gaborMag(:,:,3),img8_gaborMag(:,:,3)));

%135度
O_2_5_135=double(directionfeature_diff(img2_gaborMag(:,:,4),img5_gaborMag(:,:,4)));
O_2_6_135=double(directionfeature_diff(img2_gaborMag(:,:,4),img6_gaborMag(:,:,4)));
O_3_6_135=double(directionfeature_diff(img3_gaborMag(:,:,4),img6_gaborMag(:,:,4)));
O_3_7_135=double(directionfeature_diff(img3_gaborMag(:,:,4),img7_gaborMag(:,:,4)));
O_4_7_135=double(directionfeature_diff(img4_gaborMag(:,:,4),img7_gaborMag(:,:,4)));
O_4_8_135=double(directionfeature_diff(img4_gaborMag(:,:,4),img8_gaborMag(:,:,4)));


%%
%%综合显著图
%归一化图像
I_2_5=normalizeImg(I_2_5);
I_2_6=normalizeImg(I_2_6);
I_3_6=normalizeImg(I_3_6);
I_3_7=normalizeImg(I_3_7);
I_4_7=normalizeImg(I_4_7);
I_4_8=normalizeImg(I_4_8);

RG_2_5=normalizeImg(RG_2_5);
RG_2_6=normalizeImg(RG_2_6);
RG_3_6=normalizeImg(RG_3_6);
RG_3_7=normalizeImg(RG_3_7);
RG_4_7=normalizeImg(RG_4_7);
RG_4_8=normalizeImg(RG_4_8);

BY_2_5=normalizeImg(BY_2_5);
BY_2_6=normalizeImg(BY_2_6);
BY_3_6=normalizeImg(BY_3_6);
BY_3_7=normalizeImg(BY_3_7);
BY_4_7=normalizeImg(BY_4_7);
BY_4_8=normalizeImg(BY_4_8);

O_2_5_0=normalizeImg(O_2_5_0);
O_2_6_0=normalizeImg(O_2_6_0);
O_3_6_0=normalizeImg(O_3_6_0);
O_3_7_0=normalizeImg(O_3_7_0);
O_4_7_0=normalizeImg(O_4_7_0);
O_4_8_0=normalizeImg(O_4_8_0);

O_2_5_45=normalizeImg(O_2_5_45);
O_2_6_45=normalizeImg(O_2_6_45);
O_3_6_45=normalizeImg(O_3_6_45);
O_3_7_45=normalizeImg(O_3_7_45);
O_4_7_45=normalizeImg(O_4_7_45);
O_4_8_45=normalizeImg(O_4_8_45);

O_2_5_90=normalizeImg(O_2_5_90);
O_2_6_90=normalizeImg(O_2_6_90);
O_3_6_90=normalizeImg(O_3_6_90);
O_3_7_90=normalizeImg(O_3_7_90);
O_4_7_90=normalizeImg(O_4_7_90);
O_4_8_90=normalizeImg(O_4_8_90);

O_2_5_135=normalizeImg(O_2_5_135);
O_2_6_135=normalizeImg(O_2_6_135);
O_3_6_135=normalizeImg(O_3_6_135);
O_3_7_135=normalizeImg(O_3_7_135);
O_4_7_135=normalizeImg(O_4_7_135);
O_4_8_135=normalizeImg(O_4_8_135);

%综合计算
%亮度
I_c2=I_2_5+I_2_6;
I_c3=I_3_7+I_3_6;
I_c4=I_4_7+I_4_8;

I_c3=imresize(I_c3,size(I_c2),'nearest');
I_c4=imresize(I_c4,size(I_c2),'nearest');

I=(I_c2+I_c3+I_c4);

%色度
c2=RG_2_5+BY_2_5+RG_2_6+BY_2_6;
c3=RG_3_6+BY_3_6+RG_3_7+BY_3_7;
c4=RG_4_7+BY_4_7+RG_4_8+BY_4_8;

c3=imresize(c3,size(c2),'nearest');
c4=imresize(c4,size(c2),'nearest');

C=(c2+c3+c4);

%方向
O2=O_2_5_0+O_2_5_45+O_2_5_90+O_2_5_135+O_2_6_0+O_2_6_45+O_2_6_90+O_2_6_135;
O3=O_3_6_0+O_3_6_45+O_3_6_90+O_3_6_135+O_3_7_0+O_3_7_45+O_3_7_90+O_3_7_135;
O4=O_4_7_0+O_4_7_45+O_4_7_90+O_4_7_135+O_4_8_0+O_4_8_45+O_4_8_90+O_4_8_135;

O3=imresize(O3,size(O2),'nearest');
O4=imresize(O4,size(O2),'nearest');


O=normalizeImg(O2+O3+O4);

S=(double(I)+double(O)+double(C))./3;

figure,
imshow(S,[]);

% S=imresize(S,[m,n]);
% imwrite(mat2gray(S),path2)











