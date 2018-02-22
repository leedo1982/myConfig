
local normal_keyflag = false
local control_keyflag = false
local fnkeyflag = false

-- 마우스 클릭 이벤트 구독 
normal_mousedownevent = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},function(event)
    local keycode = hs.keycodes.map[event:getKeyCode()]
    if(control_keyflag == true) then
        normal_keyflag = true
    elseif(control_keyflag == false) then
        normal_keyflag = false
    end

end)
normal_mousedownevent:start()

-- 키 다운 이벤트 구독 
normal_keydownevent = hs.eventtap.new({hs.eventtap.event.types.keyDown},function(event)
    local keycode = hs.keycodes.map[event:getKeyCode()]

    if(control_keyflag == true) then
        normal_keyflag = true
    elseif(control_keyflag == false) then
        normal_keyflag = false
    end

    if(fnkeyflag) then
        if(keycode == 'h') then
            event:setKeyCode(hs.keycodes.map['left'])
        elseif(keycode == 'j') then
            event:setKeyCode(hs.keycodes.map['down'])
         elseif(keycode == 'k') then
            event:setKeyCode(hs.keycodes.map['up'])
        elseif(keycode == 'l') then
            event:setKeyCode(hs.keycodes.map['right'])
        end
    end
end)
normal_keydownevent:start()

control_keyevent = hs.eventtap.new({hs.eventtap.event.types.flagsChanged},function(event)
    local flags = event:getFlags()
    local keycode = hs.keycodes.map[event:getKeyCode()]

    if(flags.ctrl == true) then
        control_keyflag = true
    elseif(flags.ctrl == nil) then
        control_keyflag = false
    end

    if(flags.fn == true) then
        fnkeyflag = true
    end

    if(keycode == 'rightctrl' and flags.ctrl == nil and normal_keyflag == false) then 
        print('rightCtrl & escape !!')
        changeLanguage()
        hs.eventtap.keyStroke({}, 'escape')
        fnkeyflag = false
    end

    normal_keyflag = false

    return false
end)
control_keyevent:start()

-- 한영전환 function 
function changeLanguage()
    local inputEnglish = "com.apple.keylayout.ABC"
    local input_source = hs.keycodes.currentSourceID()

    if not (input_source == inputEnglish) then
        print('change language!!!')
        hs.keycodes.currentSourceID(inputEnglish)
    end
end

