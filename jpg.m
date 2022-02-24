clear all;clc;

%读取一张图片，并显示
original_picture=imread('芭芭拉.jpg');
subplot(2,2,1);
imshow(original_picture);
title('Original Picture')

%分别读取R、G、B的值，1代表R，2代表G，3代表B
image_r=original_picture(:,:,1);
image_g=original_picture(:,:,2);
image_b=original_picture(:,:,3);

subplot(222)
imshow(image_r);
title('R  Part');

subplot(223)
imshow(image_g);
title('G  Part');

subplot(224)
imshow(image_b);
title('B  Part');
