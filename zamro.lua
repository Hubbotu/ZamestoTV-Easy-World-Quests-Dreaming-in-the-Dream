local addonName, addon = ...
local listener = CreateFrame("Frame")
listener:RegisterEvent("CHAT_MSG_MONSTER_SAY")
listener:SetScript("OnEvent", function(self, event, text, monsterName)
    if event == "CHAT_MSG_MONSTER_SAY" then
        local mapID = C_Map.GetBestMapForUnit("player")
        if mapID ~= 2200 then return end

        for _, data in pairs(addon.db) do
            local announce = data.announce
            if announce and announce[GetLocale()] and (announce[GetLocale()] == text) then
                RaidNotice_AddMessage(RaidWarningFrame, data.name[GetLocale()], ChatTypeInfo["RAID_WARNING"])
            end
        end
    end
end)