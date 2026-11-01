-- ==========================================
-- SCRIPT BUATAN SENDIRI DARI NOL
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Memunculkan notifikasi pop-up di pojok kanan bawah layar game
StarterGui:SetCore("SendNotification", {
    Title = "Script Berhasil!",
    Text = "Halo " .. player.Name .. ", script buatan sendiri aktif!",
    Duration = 5
})

print("Script buatan " .. player.Name .. " berhasil 

    -- ==========================================
-- SCRIPT AUTO TREADMILL / TELEPORT KE ALAT
-- ==========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill On!",
    Text = "Mencari dan mendekati treadmill...",
    Duration = 3
})

task.spawn(function()
    while true do
        task.wait(1) -- Cek setiap 1 detik
        
        pcall(function()
            -- Cari objek treadmill di dalam workspace berdasarkan namanya
            for _, v in pairs(workspace:GetDescendants()) do
                -- Sesuaikan kata kunci nama treadmill di game ini (misal: "Treadmill" atau nama part-nya)
                if v:IsA("BasePart") and (v.Name:lower():find("treadmill") or v.Name:lower():find("gym")) then
                    -- Teleport karakter langsung ke atas treadmill tersebut
                    rootPart.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end)
    end
end)
