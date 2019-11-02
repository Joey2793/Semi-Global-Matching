function [cost_matrix, cost_matrixr] = diff_cost(grayl,grayr,D)
%close all; clear all;clc;
%imgl = imread('dataset\data1\img1.png');
%imgr = imread('dataset\data1\img2.png');
%img to intensity
%grayl = double(rgb2gray(imgl));
%grayr = double(rgb2gray(imgr));
[H,W,Chanel] = size(grayl);
%zc = zeros(H,1);
zc = zeros(H,1,3);
%disparity range D-1
%either 0~D-1 not consider in later's calculation or didn't have value
%smaller than 0
%D = 16;
cost_matrix = zeros(H,W,D);
cost_matrixr = zeros(H,W,D);


testr= grayr;
testl = grayl;
for i = 1:D
    if i == 1
        cost_matrix(:,:,i) = sum(abs(grayl-grayr),3);
        cost_matrixr(:,:,i) = sum(abs(grayl-grayr),3);
        
        %cost_matrix(:,:,i) = conv2(x,f,'same');
         
        x = movsum(cost_matrix(:,:,i),3,1);
        y = movsum(cost_matrix(:,:,i),3,2);
        xr = movsum(cost_matrixr(:,:,i),3,1);
        yr = movsum(cost_matrixr(:,:,i),3,2);
        cost_matrix(:,:,i) = (x+y);
        cost_matrixr(:,:,i) = (xr+yr);
        
        %cost_test(:,:,i) = abs(grayr - grayl);
    else
        testl(:,1,:) = [];
        testr(:,W,:) = [];
        testl = [testl,zc];
        testr = [zc,testr];
        
        cost_matrix(:,:,i) = sum(abs(grayl-testr),3);
        cost_matrixr(:,:,i) = sum(abs(grayr-testl),3);
        %cost_matrix(:,:,i) = conv2(x,f,'same');
        x = movsum(cost_matrix(:,:,i),3,1);
        y = movsum(cost_matrix(:,:,i),3,2);
        xr = movsum(cost_matrixr(:,:,i),3,1);
        yr = movsum(cost_matrixr(:,:,i),3,2);
        cost_matrix(:,:,i) = (x+y);
        cost_matrixr(:,:,i) = (xr+yr);
        %cost_test(:,:,i) = abs(testl - grayr);
    end
end
end



    
    


