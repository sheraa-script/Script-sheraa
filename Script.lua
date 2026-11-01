-- ==========================================
-- SCRIPT AUTO TREADMILL V4 (GLOBAL & PERFECT POS)
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill v4",
    Text = "Jangkauan seluruh map aktif!",
    Duration = 4
})

task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(function()
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            local rootPart = character.HumanoidRootPart

            -- Cari seluruh part treadmill di dalam map tanpa batasan jarak dekat
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    local name = obj.Name:lower()
                    if name:find("treadmill") or name:find("belt") or name:find("train") then
                        -- Posisikan karakter berdiri tegak pas di atas permukaan treadmill
                        rootPart.CFrame = obj.CFrame + Vector3.new(0, 4, 0)
                        
                        -- Picu sentuhan agar game membaca aktivitas latihan
                        firetouchinterest(rootPart, obj, 0)
                        firetouchinterest(rootPart, obj, 1)
                        break
                    end
                end
            end
        end)
    end
end)

print("Auto Treadmill v4 loaded for: " .. player.Name)
