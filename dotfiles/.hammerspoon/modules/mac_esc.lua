
local normal_keyflag = false
local mouse_keyflag = false
local control_keyflag = false

-- 키 다운 이벤트 구독 
normal_keydownevent = hs.eventtap.new({hs.eventtap.event.types.keyDown},function(event)
    local keycode = hs.keycodes.map[event:getKeyCode()]

    print("kedon event:", keycode)

    if(control_keyflag == true) then
        normal_keyflag = true
    elseif(control_keyflag == false) then
        normal_keyflag = false
    end

    if(keycode == "yen") then
    print("yen event:", keycode)
       hs.eventtap.keyStroke({},'1' )
    end

    
end)
normal_keydownevent:start()

-- 마우스 다운 이벤트 구독 
normal_mousevent = hs.eventtap.new({hs.eventtap.event.types.leftMouseDown},function(event)
    local mousecode = hs.keycodes.map[event:getKeyCode()]

    print("mouse left down event:", mousecode)

    if(control_keyflag == true) then
        mouse_keyflag = true
    elseif(control_keyflag == false) then
       mouse_keyflag = false
    end

end)
normal_mousevent:start()

control_keyevent = hs.eventtap.new({hs.eventtap.event.types.flagsChanged},function(event)
    local flags = event:getFlags()
    local keycode = hs.keycodes.map[event:getKeyCode()]
    print("kedon2 event:", keycode)
    local mouse = hs.keycodes.map[event:getKeyCode()]
    print("kedon2 event:", keycode)

    if(flags.ctrl == true) then
        control_keyflag = true
    elseif(flags.ctrl == nil) then
        control_keyflag = false
    end


    if(keycode == 'ctrl' and flags.ctrl == nil and normal_keyflag == false and mouse_keyflag == false) then 
        print('Ctrl & escape !!')
        changeLanguage()
        hs.eventtap.keyStroke({}, 'escape')
    end

    normal_keyflag = false
    mouse_keyflag = false

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

