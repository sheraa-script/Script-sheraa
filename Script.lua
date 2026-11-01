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

print("Script buatan " .. player.Name .. " berhasil dimuat!")
