
local normal_keyflag = false
local control_keyflag = false



control_keyevent = hs.eventtap.new({hs.eventtap.event.types.flagsChanged},function(event)
    local keycode = hs.keycodes.map[event:getKeyCode()]

        print('rightCtrl !'+ keycode)

    if(keycode == 'escape') then 
        print('rightCtrl & escape !!')
        changeLanguage()
    end

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

