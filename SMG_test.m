close all; clear all;clc;
img1 = imread('dataset\data3\img1.png');
img2 = imread('dataset\data3\img2.png');

imgl = double(img1);

imgr = double(img2);
figure;

p1 = 10;
p2 = 40;
D = 50;
[cost_matrix, cost_matrixr] = diff_cost(imgl,imgr,D);


index = Smooth_cost(cost_matrix, p1,p2,D);
%indexr = Smooth_cost(cost_matrixr, p1,p2,D);
map = imshow(index, [0,D]);

%imwrite(map,'dataset\data2\result1_4.png');
