print("Starting Hello World")


local sounds = {
    ["28766"] = {
        ["sound"] = "Interface\\AddOns\\eCoordinates\\Sounds\\28766.mp3",
        ["description"] = "Sound for quest 28766"
    }
}

function HelloWorldHandler_EventSetter(self, event, ...)
    print("registering event")
    --self:RegisterEvent("QUEST_GREETING")
    --self:RegisterEvent("QUEST_DETAIL")
    --self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("QUEST_DATA_LOAD_RESULT")
end

function HelloWorldHandler_OnEvent(self, event, ...)
    -- if event == "QUEST_DETAIL" then
    --     print("QUEST_DETAIL")
    --     print(self)
    --     print(event)
    --     print(...)
    -- end
    if event == "QUEST_DATA_LOAD_RESULT" then
        local arg1, arg2 = ...;
        print(arg1) -- arg1 = questid
        -- print(arg2)
        arg1 = string.gsub(arg1, "%s+", "") -- removing extra spaces
        local matchesKnownTrack = sounds[arg1] ~= nil --true / false

        if(matchesKnownTrack) then
            local soundFile = sounds[arg1]
            PlaySoundFile(soundFile.sound)
        end
    end
end
