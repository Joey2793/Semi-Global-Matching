% close all; clear all;clc;
% imgl = imread('dataset\data3\img1.png');
% imgr = imread('dataset\data3\img2.png');
% %img to intensity
% grayl = double(imgl);
% grayr = double(imgr);
% %[H,W] = size(imgl); 
% p1 = 1;
% p2 = 4;
% D = 50;
% [cost_matrix, cost_matrixr] = diff_cost(grayl,grayr,D);
%0~15
%cost_matrix = Data_cost(grayl,grayr,D);
function index = Smooth_cost(cost_matrix, p1,p2,D)
%l = double(imgl);
%r = double(imgr);
%cost_matrix = test();
%test_matrix=zeros(2,W);
[H,W,chanel] = size(cost_matrix);
Disparity = zeros(H,W,D);
%up to down
n_s = cost_matrix;
%down to up
s_n =cost_matrix;
%left to right
w_e = cost_matrix;
%right to left
e_w = cost_matrix;
%upper left to down right
nw_se = cost_matrix;
%down right to upper left
se_nw = cost_matrix;
%down left to upper right
sw_ne = cost_matrix;
%upper right to down left
ne_sw =cost_matrix;
%temp = zeros(1,D);

%w_e(:,1,:) = cost_matrix(:,1,:);
%nw_se(:,1,:) = cost_matrix(:,1,:);
%nw_se(1,:,:) = cost_matrix(1,:,:);
for row = 1:H
    for col = 1:W
        if col > 1 %left to right
            test_matrix = w_e(row,col-1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            w_e(row,col,:) = cost_matrix(row,col,:) + min_matrix-i_matrix; end
        if col > 1 & row > 1
            test_matrix = nw_se(row-1,col-1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            nw_se(row,col,:) = cost_matrix(row,col,:) + min_matrix-i_matrix; end   
    end
end
%e_w(:,W,:) = cost_matrix(:,W,:); %right to left
%ne_sw(1,:,:) = cost_matrix(1,:,:);
%ne_sw(:,W,:) = cost_matrix(:,W,:);
for row1 = 1:H
    for col1 = W:-1:1
        if col1 < W
            test_matrix = e_w(row1,col1+1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            e_w(row1,col1,:) = cost_matrix(row1,col1,:) + min_matrix-i_matrix ; end
        if col1 < W & row1 > 1
            test_matrix = ne_sw(row1-1,col1+1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            ne_sw(row1,col1,:) = cost_matrix(row1,col1,:) + min_matrix- i_matrix; end
    end
end
%s_n(H,:,:) = cost_matrix(H,:,:); %down to up
%sw_ne(H,:,:) = cost_matrix(H,:,:);
%sw_ne(:,1,:) = cost_matrix(:,1,:);
for col2 = 1:W
    for row2 = H:-1:1
        if row2 < H
            test_matrix = s_n(row2+1,col2,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            s_n(row2,col2,:) = cost_matrix(row2,col2,:) + min_matrix-i_matrix; end
        if row2 < H & col2 > 1
            test_matrix = sw_ne(row2+1,col2-1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            sw_ne(row2,col2,:) = cost_matrix(row2,col2,:) + min_matrix - i_matrix; end
    end
end
%n_s(1,:,:) = cost_matrix(1,:,:); %up to down
for col3 = 1:W
    for row3 = 1:H
        if row3 >1
            test_matrix = n_s(row3 -1,col3,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            n_s(row3,col3,:) = cost_matrix(row3,col3,:) + min_matrix - i_matrix; end
       
    end
end

%se_nw(H,:,:) = cost_matrix(H,:,:); 
%se_nw(:,W,:) = cost_matrix(:,W,:);
for col4 = W:-1:1
    for row4 = H:-1:1
        if row4 <H & col4 < W
            test_matrix = se_nw(row4+1,col4+1,:);
            [min_matrix,i_matrix] = get_min(D,p1,p2,test_matrix);
            %min_matrix = get_min(D,p1,p2,test_matrix);
            se_nw(row4,col4,:) = cost_matrix(row4,col4,:)+ min_matrix - i_matrix; end
       
    end
end
%         if (row < H) & (col < W)
%             test_matrix = cost_matrix(row +1,col+1,:);
%             [min_matrix,i_matrix] = get_min(row,col,D,p1,p2,test_matrix);
%             nw_se(row,col,:) = cost_matrix(row,col,:) + min_matrix - i_matrix; end
%         if (row >1) & (col > 1)
%             test_matrix = cost_matrix(row -1,col-1,:);
%             [min_matrix,i_matrix] = get_min(row,col,D,p1,p2,test_matrix);
%             se_nw(row,col,:) = cost_matrix(row,col,:) + min_matrix - i_matrix; end
%         if (row >1) & (col < W)            
%             test_matrix = cost_matrix(row -1,col+1,:);
%             [min_matrix,i_matrix] = get_min(row,col,D,p1,p2,test_matrix);
%             sw_ne(row,col,:) = cost_matrix(row,col,:) + min_matrix - i_matrix; end    
%         if (row < H) & (col >1)
%             test_matrix = cost_matrix(row +1,col-1,:);
%             [min_matrix,i_matrix] = get_min(row,col,D,p1,p2,test_matrix);
%             ne_sw(row,col,:) = cost_matrix(row,col,:) + min_matrix - i_matrix; end 
%             
%         
%     end
% end
Disparity = n_s + s_n+  w_e + e_w+ nw_se + se_nw + sw_ne + ne_sw;

%map = zeros(H,W);
%for a = 1: H
 %   for b = 1: W
%        [dispImg, index] = min(Disparity(a,b,:));
%        map(a,b) = index;
%    end
%end
[dispImg, index] = min(Disparity,[],3);
imagesc(index);
%end


        
        

        