local obj = {}

function obj:init(key)

    local win_mode = hs.hotkey.modal.new()

    local move_win = function(xx, yy, ww, hh)
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local max = win:screen():frame()
        f.x = max.x + (max.w/2) * xx
        f.y = max.y + (max.h/2) * yy
        f.w = max.w / ww
        f.h = max.h / hh
        win:setFrame(f)
        win_mode.triggered = true
    end

    win_mode:bind({}, 'z', function() move_win(0, 1, 2, 2) end)
    win_mode:bind({}, 'x', function() move_win(0, 1, 1, 2) end)
    win_mode:bind({}, 'c', function() move_win(1, 1, 2, 2) end)
    win_mode:bind({}, 'a', function() move_win(0, 0, 2, 1) end)
    win_mode:bind({}, 's', function() move_win(0, 0, 1, 1) end)
    win_mode:bind({}, 'd', function() move_win(1, 0, 2, 1) end)
    win_mode:bind({}, 'q', function() move_win(0, 0, 2, 2) end)
    win_mode:bind({}, 'w', function() move_win(0, 0, 1, 2) end)
    win_mode:bind({}, 'e', function() move_win(1, 0, 2, 2) end)

    function send_window_prev_monitor()
        local win = hs.window.focusedWindow()
        local nextScreen = win:screen():previous()
        win:moveToScreen(nextScreen)
    end

    function send_window_next_monitor()
        local win = hs.window.focusedWindow()
        local nextScreen = win:screen():next()
        win:moveToScreen(nextScreen)
    end

    win_mode:bind({}, 'n', send_window_prev_monitor)
    win_mode:bind({}, 'b', send_window_next_monitor)

    local on_win_mode = function() win_mode:enter() end
    local on_win_mode = function()
        win_mode.triggered = false
        win_mode:enter()
    end

    local off_win_mode = function()
        win_mode:exit()
    end

    hs.hotkey.bind({}, key, on_win_mode, off_win_mode)
end

return obj
