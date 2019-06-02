# Pick_Data_Easy_V2
This is a tool based on MATLAB for picking data points out of a chart. Cartesian coordinate ONLY! You can run the test_pick_data_easy_V2.m file as a demo directly, or you can read the following 

Any suggestions or any BUG found, please contact me via wang.skoud@gmail.com. Thanks. 

如有任何建议，或者发现 BUG，请通过邮件 wang.skoud@gmail.com 联系我，谢谢. 

## Specify a picture with data of your interest. 

Here, the '1.bmp' file is simply an example. You can use any format as long as MATLAB imread.m function support, such as *.jpg, *.bmp and etc.. 

Some basic instructions: 
* Use the left button of your mouse to pick or undo pick a coordinate on the figure.  
* Use the middle button of your mouse to enter keyboard mode, where you can use 1 to enter normal mode, and -1 to undo mode, -2 to calibration. Remember ot press the 'ENTER' button on your keyboard when you are done with the input to continue. 
*  Use the right button of your mouse to exit the coordinate picking process when you are done. It will ask you twice before it really exits. 

The first four coordinates you picked is for calibration. 

```
pic_name = './1.bmp';
the_coordinates_you_picked = pick_data_easy_V2(pic_name); 
```

## Transfer the coordinate into exact data points. 
Addtional information for your calibration. 
Axis = [x1, x2, y1, y2] is the four points you picked.  

```
the_data_you_picked = transfer2realData(the_coordinates_you_picked, [-0.4 0.4 -0.8, 0.2]);
```

## Show the results
The value in 'the_data_you_picked' is what you want. 

```
figure();clf;
plot(the_data_you_picked(:,1),the_data_you_picked(:,2),'b*-');
```


