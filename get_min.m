function [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix)
%function min_matrix = get_min(D,p1,p2,test_matrix)
%close all; clear all;clc;
%imgl = imread('dataset\data1\img1.png');
%imgr = imread('dataset\data1\img2.png');
%img to intensity
%grayl = double(rgb2gray(imgl));
%grayr = double(rgb2gray(imgr));
%D = 16;
%p1 = 1;
%p2 = 4;
%0~15
%cost_matrix = Data_cost(grayl,grayr,D);
%test_matrix = cost_matrix(row,col,:);
min_matrix = zeros(1,1,D);
i_matrix = zeros(1,1,D);

for i = 1:D
    min_term = 100000;
    i_term = 100000;
    for j = 1:D
        if i-j == 0
            min_term = min([min_term,test_matrix(1,1,j)]);
        elseif (abs(i-j) == 1)
            min_term = min([min_term,test_matrix(1,1,j)+p1]);
        else
            min_term = min([min_term,test_matrix(1,1,j)+p2]);
            i_term = min(i_term,test_matrix(1,1,j));
        end
    end
    min_matrix(1,1,i) = min_term;
    i_matrix(1,1,i) = i_term;
end

            