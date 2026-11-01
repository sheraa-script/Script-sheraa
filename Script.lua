-- ==========================================
-- SCRIPT BUATAN SENDIRI DARI NOL
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Memunculkan notifikasi di pojok kanan bawah game
StarterGui:SetCore("SendNotification", {
    Title = "Script Berhasil!",
    Text = "Halo " .. player.Name .. ", script buatan sendiri aktif!",
    Duration = 5
})

print("Script buatan " .. player.Name .. " berhasil dimuat!")


-- ==========================================
-- SCRIPT AUTO TREADMILL FIX (STEAL AN EGG)
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill Ready!",
    Text = "Berdiri di dekat treadmill, script aktif...",
    Duration = 4
})

task.spawn(function()
    while true do
        task.wait(0.3)
        
        pcall(function--[[Auto Interact Treadmill]]()
            -- Cari semua objek interaksi atau kursi latihan di sekitar game
            for _, obj in pairs(workspace:GetDescendants()) do
                -- Cek apakah itu ProximityPrompt atau Seat yang berhubungan dengan latihan/treadmill
                if obj:IsA("ProximityPrompt") then
                    local text = (obj.ActionText .. " " .. obj.ObjectText):lower()
                    if text:find("treadmill") or text:find("train") or text:find("gym") then
                        fireproximityprompt(obj)
                    end
                elseif obj:IsA("Seat") or obj:IsA("VehicleSeat") then
                    if obj.Name:lower():find("treadmill") or obj.Name:lower():find("gym") then
                        -- Jika karakternya dekat, dudukkan ke seat treadmill tersebut
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            if (player.Character.HumanoidRootPart.Position - obj.Position).Magnitude < 10 then
                                obj:Sit(player.Character.Humanoid)
                            end
                        end
                    end
                end
            end
        end)
    end
end)
