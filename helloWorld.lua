print("Starting Hello World")

SLASH_HELP1 = "/help"
SLASH_HELP2 = "/h"

local sounds = {
    ["28766"] = {
        ["sound"] = "Interface\\AddOns\\TextToSpeech\\Sounds\\28766.mp3",
        ["description"] = "Sound for quest 28766"
    }
}

function HelloWorldHandler_EventSetter(self, event, ...)
    print("registering event")
    self:RegisterEvent("QUEST_GREETING")
    self:RegisterEvent("QUEST_DETAIL")
    --self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    self:RegisterEvent("QUEST_PROGRESS")
    self:RegisterEvent("QUEST_ACCEPTED")
    self:RegisterEvent("QUEST_LOG_CRITERIA_UPDATE")
end

function HelloWorldHandler_OnEvent(self, event, ...)
    if event ~= "QUEST_DATA_LOAD_RESULT" then
        print(self)
        print(event)
        print(...)
    end
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

function playHelpHander()
    -- playing with stuff found here: https://www.wowinterface.com/forums/showthread.php?t=58132
    sleep(2)
    print("start")
    print(C_QuestLog.GetNumQuestLogEntries())
    local numEntries, numQuests = C_QuestLog.GetNumQuestLogEntries()
    print("hi")
    DEFAULT_CHAT_FRAME:AddMessage(numEntries .. " entries containing " .. numQuests .. " quests in your quest log.");
end

SlashCmdList["HELP"] = playHelpHander
