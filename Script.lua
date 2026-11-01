-- ==========================================
-- SCRIPT AUTO TREADMILL V3 (TOUCH & POSITION)
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill v3",
    Text = "Mode sentuh & posisi aktif!",
    Duration = 4
})

task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(function()
            local character = player.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            local rootPart = character.HumanoidRootPart

            -- Cari bagian part treadmill di dalam map
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    local name = obj.Name:lower()
                    -- Cek nama objek yang berhubungan dengan treadmill atau alat latihan
                    if name:find("treadmill") or name:find("belt") or name:find("train") then
                        -- Cek jarak: kalau karakter berada dekat dengan treadmill tersebut (dalam radius 15 meter)
                        if (rootPart.Position - obj.Position).Magnitude < 15 then
                            -- Posisikan karakter pas di atas alatnya agar terhitung sedang memakai
                            rootPart.CFrame = obj.CFrame + Vector3.new(0, 3, 0)
                            
                            -- Panggil event sentuh jika ada
                            firetouchinterest(rootPart, obj, 0)
                            firetouchinterest(rootPart, obj, 1)
                        end
                    end
                end
            end
        end)
    end
end)

print("Auto Treadmill v3 loaded for: " .. player.Name)
