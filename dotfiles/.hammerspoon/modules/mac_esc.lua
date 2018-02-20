
-- 해피해킹 키보드 처럼 caps_lock를 controll로 사용하기  + vim 또한 편리하게 
-- vim 사용하며 esc 키로 영자 전환을 하며, 동시에 해피해킹과 같이 control 키로 동시에 사용하기 위해 
-- 왜 caps_lock 키 인가? caps_lock 키의 활용도가 제일 낮고 해피해킹과 동일한 위치
-- 왜 right_controll 키 인가? 맥북에는 right_control키가 없고, modifier key의 기능을 유지하기 위함

-- 선행작업 . karabiner 로  caps_lock 을 right_control로 변경한다. 
-- 아래 코드를 hammerspoon으로 활성화 한다. 


local normal_keyflag = false
local control_keyflag = false

normal_keydownevent = hs.eventtap.new({hs.eventtap.event.types.keyDown},function(event)
    local keycode = hs.keycodes.map[event:getKeyCode()]
    if(control_keyflag == true) then
        normal_keyflag = true
    elseif(control_keyflag == false) then
        normal_keyflag = false
    end

    return false
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

    if(keycode == 'rightctrl' and flags.ctrl == nil and normal_keyflag == false) then 
        print('rightCtrl & escape !!')
        changeLanguage()
        hs.eventtap.keyStroke({}, 'escape')
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

