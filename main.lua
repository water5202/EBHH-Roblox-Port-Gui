local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3"))()
local w = library:CreateWindow("EBHH")
local b = w:CreateFolder("(v1.0.0)")
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Made by Water.5202!",
    Text = "Thanks for using the script :D!",
    Duration = 3
})

local attackid = false
local autoselectid = false
local attackdr = false
local autoselectdr = false

b:Button("Auto Select ID", function()
    autoselectid = true
    task.spawn(function()
        while autoselectid do
            local enemy = workspace:FindFirstChild("Enemies") and workspace.Enemies:FindFirstChild("THE_ID")
            if enemy then
                local args = { "FIGHT", enemy, "" }
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("RequestAction"):FireServer(unpack(args))
                end)
                if not success then
                    warn("NOATTACKSELECT", err)
                end
            else
                warn("NOID")
            end
            task.wait(0.1)
        end
    end)
end)

b:Button("Auto Attack ID", function()
    attackid = true
    task.spawn(function()
        while attackid do
            local args = { 0.5 }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Fight_Skill"):FireServer(unpack(args))
            end)
            if not success then
                warn("attackfail", err)
            end
            task.wait(0.00001)
        end
    end)
end)

b:Button("Auto Select DR_A", function()
    autoselectdr = true
    task.spawn(function()
        while autoselectdr do
            local enemy = workspace:FindFirstChild("Enemies") and workspace.Enemies:FindFirstChild("DR_A")
            if enemy then
                local args = { "FIGHT", enemy, "" }
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("RequestAction"):FireServer(unpack(args))
                end)
                if not success then
                    warn("NOATTACKSELECT_DR", err)
                end
            else
                warn("NODR")
            end
            task.wait(0.1)
        end
    end)
end)

b:Button("Auto Attack DR_A", function()
    attackdr = true
    task.spawn(function()
        while attackdr do
            local args = { 0.5 }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Fight_Skill"):FireServer(unpack(args))
            end)
            if not success then
                warn("attackfail_DR", err)
            end
            task.wait(0.00001)
        end
    end)
end)

b:Button("Stop (ID and DR_A)", function()
    autoselectid = false
    attackid = false
    autoselectdr = false
    attackdr = false
end)

b:Button("Rejoin", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local placeId = game.PlaceId
    TeleportService:Teleport(placeId, player)
end)
