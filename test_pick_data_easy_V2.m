% test_pick_data_easy_V2.m
%  Cartesian coordinates Version 2.0 
%
% Author£º Yuan Wang
% Email£º  1220510620@qq.com, wang.skoud@gmail.com 
% Date£º   2019/6/1 12:26
% The copyright is free! Enjoy it. 


%% specify a picture with data of your interest. 

pic_name = './1.bmp';
the_coordinates_you_picked = pick_data_easy_V2(pic_name); 


%% addtional information for your calibration, the [x1, x2, y1, y2] of the four points you picked. 
% the input parameter: axis = [x1 x2, y1 y2];

the_data_you_picked = transfer2realData(the_coordinates_you_picked, [-0.4 0.4 -0.8, 0.2]);

figure(1e5+1);clf;
plot(the_data_you_picked(:,1),the_data_you_picked(:,2),'b*-');











