
% a tool used for data picking from pictures. 

% Author£º Yuan Wang
% Email£º  1220510620@qq.com, wang.skoud@gmail.com 
% Date£º   2019/6/1 12:26
% The copyright is free! Enjoy it. 

%% 
function Nodes = pick_data_easy_V2(pic_name)
%% load picture
[A,~] = imread(pic_name);
figure(1e5); clf
imshow(A);
set(gca, 'fontsize', 14);
hold on;

%% the coordinates you picked. 

hfig_calibrate = plot([NaN NaN], [NaN NaN],'bo','linewidth',5);
hfig_picking = plot([NaN NaN], [NaN NaN],'rs-','linewidth',2);

status_ = 'Caibration. Now pick coordinates: x1, x2, y1, y2 ';
update_status(status_);

%% working mode: 
% % 1 for normal mode, 
% % -1 for undo mode,  
% % -2 for calibration mode, 
% % and 0 for keyboard mode. 

Working_mode = -2;

%% 
% set(gca,'AlphaData',alpha)
Nodes_calib = zeros(4, 2) * NaN;
Nodes_picking = zeros(0, 2) * NaN;
pick_count = 0;
calib_count = 0;
button = 1;

exit_count = 0;
while strcmp('Pretty girl', 'Pretty girl')
    %% exit operation
    if button == 3 
        exit_count = exit_count + 1; 
        if exit_count == 1
            status_ = 'Please rigth click again to confirm exit point picking! ';
            update_status(status_);
            [~, ~, button] = ginput(1);
            continue;
        elseif exit_count == 2 
            status_ = 'Now Finished! ';
            update_status(status_);
            break;
        end 
    end
    
    %% entering keyboard mode, so you can redo some points 
    if button == 2
        num_input = input('Input a command:, \n ''1'' to normal \n ''-2'' for calibrating, \n ''-1'' to undo picking,  \n and ''0'' to keyboard'',  \n or just press Enter to continue ...\n'); 
        if isempty(num_input)
%             Working_mode = Working_mode;   %% ------ default.  Unchanged!
        else
            if num_input == -1
                status_ = 'Redo mode on, please choose the point you want to deleted! ';
                update_status(status_);
                Working_mode = -1;
            elseif num_input == 1
                status_ = 'Select mode on, please choose the coordinate you want to pick up! ';
                update_status(status_);
                Working_mode = 1; 
            elseif num_input == -2
                status_ = 'Calibration mode on, please choose the coordinate you want to pick up! ';
                update_status(status_);
                Working_mode = -2; 
                calib_count = 0;
                Nodes_calib  = Nodes_calib * NaN;
            else
                Working_mode = 0;
                keyboard;
            end
        end
    end
    
    %% pick a new coordinate 
    [x, y, button] = ginput(1);
    
    %% determing the operation according to the working_mode
    if button == 1   % only when left click
        if Working_mode == 1    % ----------- normal mode
            pick_count = pick_count + 1;
            Nodes_picking(pick_count,:) = [x y  ];
            disp(['pick_count = ' num2str(pick_count) ' one pair of coordinate is picked.' ]);
            
            status_ = 'Normal mode, please select a coordinate ... ';
            update_status(status_);
            
        elseif Working_mode == -2    % ----------- calibration mode
            calib_count = calib_count + 1;
            
            Nodes_calib(calib_count,:) = [x y  ];
            disp(['calib_count = ' num2str(calib_count) ' one pair of coordinate is picked.' ]);
            
            if calib_count == 4
                status_ = 'Calibration done! the working mode changes to normal!  ';
                update_status(status_);
                Working_mode = 1;
            end
            
        elseif Working_mode == -1    % ----------- redo mode 
            if isempty(Nodes_picking)
                status_ = 'No points to redo, the working mode changes to normal! ';
                update_status(status_);
                Working_mode = 1;
                continue;
            end
            dis_nodes = sum((Nodes_picking(:, [1 2]) - [x y]).^2, 2);
            [~, ind] = min(dis_nodes);
            Nodes_picking(ind(1), :) = [];
            
            pick_count = pick_count - 1;
            disp(['pick_count = ' num2str(pick_count) ', one pair of coordinate is deleted!' ]);
        end
    end
    
    %% 
    
    set(hfig_calibrate, 'xdata', Nodes_calib(:, 1), 'ydata', Nodes_calib(:, 2));  
    set(hfig_picking, 'xdata', Nodes_picking(:, 1), 'ydata', Nodes_picking(:, 2));
    drawnow;    
    
    %%
    exit_count(exit_count == 1) = 0; %#ok<AGROW>
    
end

% Nodes_calib(Nodes_calib(:,3) == 2,:) = [];
% Nodes_calib(Nodes_calib(:,3) == 3,:) = [];

Nodes = [Nodes_calib; Nodes_picking];

function update_status(str)
figure(1e5);
title(str);

















