%读取图像
Image = imread('/Users/yunyi/Desktop/testimg/object_detectEX/EX4/images/0015.jpg');
figure,
subplot 211,imshow(Image);
title('原图');
Img = im2double(rgb2gray(Image));

%傅立叶变换
FFT = fft2(Img);

%对数幅度谱
LogAmplitude = log(abs(FFT));

%相位
Phase = angle(FFT);

%原幅度谱减去局部平滑后的幅度谱
SpectralResidual = LogAmplitude - imfilter(LogAmplitude, fspecial('average', 3), 'replicate');

%融合幅度与相位
saliencyMap = abs(ifft2(exp(SpectralResidual+1i*Phase))).^2;
saliencyMap = mat2gray(imfilter(saliencyMap, fspecial('gaussian', [8, 8], 8)));

subplot 212,imshow(saliencyMap,[]);
title('SR结果');

imwrite(saliencyMap,'/Users/yunyi/Desktop/testimg/object_detectEX/EX4/SRresult/0016.jpg')