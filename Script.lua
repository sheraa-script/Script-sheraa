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

-- ==========================================
-- SCRIPT AUTO TREADMILL SEDERHANA
-- ==========================================

-- Notifikasi tanda script aktif
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill On!",
    Text = "Fitur auto treadmill sedang berjalan...",
    Duration = 3
})

-- Bagian Auto Farm / Treadmill Loop
task.spawn(function()
    while true do
        task.wait(0.5) -- Jeda waktu setengah detik setiap klik (bisa diatur cepat lambatnya)
        
        pcall(function()
            -- PERINGATAN: Bagian path ke objek treadmill di bawah ini 
            -- harus disesuaikan dengan nama objek/prompt aslinya di dalam game!
            -- Contoh umum jika menggunakan ProximityPrompt:
            
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.ActionText:lower():find("treadmill") then
                    fireproximityprompt(v)
                end
            end
        end)
    end
end)

