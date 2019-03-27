% reference:
% https://blog.csdn.net/renjinr/article/details/14002143
% https://blog.csdn.net/SMF0504/article/details/51883417

function gui_main(handles, config)
    set(handles.operation_figure_handle,'WindowButtonDownFcn',{@button_down_fun, handles, config});
    set(handles.operation_figure_handle,'WindowButtonUpFcn',{@button_up_fun, handles, config});
end

function button_down_fun(src, event, handles, config)
    point = get(gca,'CurrentPoint');    %��ȡ��ǰ������
    set(handles.operation_figure_handle,'WindowButtonMotionFcn',{@button_motion_fun, handles, config}); %��������ƶ���Ӧ
    switch (get(gcbf, 'SelectionType'))
        case 'normal'
            init_rect_position(point(1,1), point(1,2));
        case 'alt'
            init_rect_move(point(1,1), point(1,2));
    end 
end

function button_up_fun(src, event, handles, config)
    point = get(gca,'CurrentPoint');    %��ȡ��ǰ������
    set(handles.operation_figure_handle, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ
    switch (get(gcbf, 'SelectionType'))
        case 'normal'
            update_rect(point(1,1), point(1,2), handles, config);
        case 'alt'
            
    end 
end

function button_motion_fun(src, event, handles, config)
    point = get(gca,'CurrentPoint');
    switch (get(gcbf, 'SelectionType'))
        case 'normal'
            update_rect(point(1,1), point(1,2), handles, config);
        case 'alt'
            move_rect(point(1,1), point(1,2), handles, config);
    end 
end
