clear all;clc;

%读取文件句柄，图片保存在当前文件夹
img = fopen('派蒙.bmp','rb');

%根据bmp图像结构读出文件头和信息头
type = fread(img,2,'char')
imgsize = fread(img,1,'long')
bfReserved1and2 = fread(img,1,'long')
bfOffBits = fread(img,1,'long')
biSize = fread(img,1,'long')
biWidth = fread(img,1,'long')
biHeight = fread(img,1,'long')
biPlanes = fread(img,1,'short')
biBitCount = fread(img,1,'short')
biCompression = fread(img,1,'long')
biSizeImage = fread(img,1,'long')
biXPelsPerMeter = fread(img,1,'long')
biYPelsPerMeter = fread(img,1,'long')
biClrUsed = fread(img,1,'long')
biClrImportant = fread(img,1,'long')
fclose(img);

%生成包含图像RGB的矩阵
img = fopen('派蒙.bmp', 'rb'); 
[data, count] = fread(img);  

%取出在data中的RGB信息，然后重新排列矩阵  
% img_data = zeros(biWidth, biHeight);  
img_data = reshape(data(bfOffBits+1:end), biWidth*3,biHeight);  
img_data = flipud(img_data'); %先转置，然后上下交换    

%分别取出RGB各个分量信息，再合成
cloB = img_data(:,1:3:end);
cloG = img_data(:,2:3:end);
cloR = img_data(:,3:3:end);
RGB(:,:,1) = cloR;
RGB(:,:,2) = cloG;
RGB(:,:,3) = cloB;
RGB = uint8(RGB);   %转换成unit格式
imshow(RGB);        %显示图片

fclose(img);

%生成RGB的txt文件，查看文件时txt需要自动换行
fid = fopen('rgb.txt','w');
for k = 1:biHeight
   for i = 1:biWidth
     fprintf(fid,'%d,%d,%d\t',img(k,3*i-2),img(k,3*i-1),img(k,3*i));
   end
     fprintf(fid,'\n');
end
fclose(fid);