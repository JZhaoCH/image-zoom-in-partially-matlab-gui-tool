function move_rect(row, col, handles, config)
    % move zoom in area according mouse position
    global info;
    row_move = row - info.rect_move_start_point(1);
    col_move = col - info.rect_move_start_point(2);
    
    if info.rect_position(1) + col_move < 1
        col_move = 1 - info.rect_position(1);
        col = col_move + info.rect_move_start_point(2);
    end
    if info.rect_position(1) + col_move + info.rect_position(3) > size(config.image, 2)
        col_move = size(config.image, 2) - info.rect_position(1) - info.rect_position(3);
        col = col_move + info.rect_move_start_point(2);
    end
    
    if info.rect_position(2) + row_move < 1
        row_move = 1 - info.rect_position(2);
        row = row_move + info.rect_move_start_point(1);
    end
    if info.rect_position(2) + row_move + info.rect_position(4) > size(config.image, 1)
        row_move = size(config.image, 1) - info.rect_position(2) - info.rect_position(4);
        row = row_move + info.rect_move_start_point(1);
    end
    
    info.rect_move_start_point(1) = row;
    info.rect_move_start_point(2) = col;
    delete(findobj(gca, 'tag', config.rect_tag));
    
    info.rect_position(1) = info.rect_position(1) + col_move;
    info.rect_position(2) = info.rect_position(2) + row_move;
    rectangle(handles.rect_plot_handle, 'position', info.rect_position, 'edgecolor', config.edgecolor, 'tag', config.rect_tag);
    refreshdata(handles.operation_figure_handle);
    show_zoomed_image(handles, config);
end