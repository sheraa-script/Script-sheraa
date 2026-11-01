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
-- SCRIPT AUTO INTERACT TREADMILL SEDERHANA
-- ==========================================

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Auto Treadmill On!",
    Text = "Berdiri dekat treadmill, script mulai memicu interaksi...",
    Duration = 4
})

-- Perulangan otomatis menekan semua tombol interaksi (ProximityPrompt) terdekat
task.spawn(function()
    while true do
        task.wait(0.3) -- Jeda setengah detik tiap pencetan
        
        pcall(function()
            for _, prompt in pairs(workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    -- Picu interaksi tombol secara otomatis tanpa harus ditekan manual
                    fireproximityprompt(prompt)
                end
            end
        end)
    end
end)
