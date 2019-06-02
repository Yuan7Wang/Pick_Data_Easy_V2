# Pick_Data_Easy_V2
This is a tool based on MATLAB for picking data points out of a chart. Cartesian coordinate ONLY. 

You can run the test_pick_data_easy_V2.m file as a demo directly, or you can read the following 

## Specify a picture with data of your interest. 

Here, the '1.bmp' file is simply an example. You can use any format as long as MATLAB imread.m function support, such as *.jpg, *.bmp and etc.. 

```
pic_name = './1.bmp';
the_coordinates_you_picked = pick_data_easy_V2(pic_name); 
```

## Transfer the coordinate into exact data points. 
Addtional information for your calibration. 
the [x1, x2, y1, y2] of the four points you picked.  
the input parameter: axis = [x1 x2, y1 y2]; 

```
the_data_you_picked = transfer2realData(the_coordinates_you_picked, [-0.4 0.4 -0.8, 0.2]);
```

## Show the results

```
figure();clf;
plot(the_data_you_picked(:,1),the_data_you_picked(:,2),'b*-');
```


