%��ȡͼ��
Image = imread('/Users/yunyi/Desktop/testimg/object_detectEX/EX4/images/0015.jpg');
figure,
subplot 211,imshow(Image);
title('ԭͼ');
Img = im2double(rgb2gray(Image));

%����Ҷ�任
FFT = fft2(Img);

%����������
LogAmplitude = log(abs(FFT));

%��λ
Phase = angle(FFT);

%ԭ�����׼�ȥ�ֲ�ƽ����ķ�����
SpectralResidual = LogAmplitude - imfilter(LogAmplitude, fspecial('average', 3), 'replicate');

%�ںϷ�������λ
saliencyMap = abs(ifft2(exp(SpectralResidual+1i*Phase))).^2;
saliencyMap = mat2gray(imfilter(saliencyMap, fspecial('gaussian', [8, 8], 8)));

subplot 212,imshow(saliencyMap,[]);
title('SR���');

imwrite(saliencyMap,'/Users/yunyi/Desktop/testimg/object_detectEX/EX4/SRresult/0016.jpg')