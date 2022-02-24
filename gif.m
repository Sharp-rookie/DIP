clc;close all;clear all

info = imfinfo('小亮.gif');%第一次读取，用于获取属性值

W = info.Width;

H = info.Height;

W = W(1);

H = H(1);

len = length(info);

figure('NumberTitle', 'off', 'ToolBar', 'none', 'Menu', 'none');

pos = get(gcf, 'position');

set(gcf, 'position', [pos(1) pos(2) W H]);

set(gca, 'position', [0 0 1 1]);

hold on;

for i = 1 : len

str=sprintf('photo%d.jpg',i);

[Ii, map] = imread('小亮.gif', 'frames', i);

imwrite(Ii,str,'jpg');

F(:, i) = im2frame(flipud(Ii), map);

end

movie(F, 20);

close;