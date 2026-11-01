-- ==========================================
-- SCRIPT AUTO TREADMILL V2 (STEAL AN EGG)
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Notifikasi penanda script aktif
StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill v2",
    Text = "Mencari ProximityPrompt Treadmill...",
    Duration = 4
})

task.spawn(function()
    while true do
        task.wait(0.2)
        pcall(function()
            for _, prompt in pairs(workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    -- Filter ketat: Cuma pemicu yang punya kata 'treadmill' atau 'machine'
                    local act = tostring(prompt.ActionText):lower()
                    local obj = tostring(prompt.ObjectText):lower()
                    local name = tostring(prompt.Name):lower()
                    
                    if act:find("treadmill") or obj:find("treadmill") or act:find("machine") or name:find("treadmill") then
                        fireproximityprompt(prompt)
                    end
                end
            end
        end)
    end
end)

print("Auto Treadmill v2 loaded for: " .. player.Name)
