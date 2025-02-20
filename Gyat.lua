local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
        Name = "BLUE LOCK: RIVALS",
        Icon = 0, 
        LoadingTitle = "SUPREME HUB",
        LoadingSubtitle = "by OneAboveAll & SHI.DED",
        Theme = "Default", 

        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false, 

        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "supremehubbluelockrivals"
        },

        Discord = {
            Enabled = true, 
            Invite = "RhaupCGhaM", 
            RememberJoins = true
        },

        KeySystem = true, 
        KeySettings = {
            Title = "SUPREME HUB | KEY",
            Subtitle = "JOIN DISCORD SERVER",
            Note = "JOIN DISCORD TO GET KEY",
            FileName = "supremehubkey",
            SaveKey = false, 
            GrabKeyFromSite = true, 
            Key = {"https://pastebin.com/raw/tfPrYT8f"} 
        }
    })


    local MainTab = Window:CreateTab("Home", nil) -- Title, Image
    local MainSection = MainTab:CreateSection("Main")

    
    local Slider = MainTab:CreateSlider({
   Name = "SPEEDBUFF",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

    local Button = MainTab:CreateButton({
   Name = "Inf stamina",
   Callback = function()
   -- The function that takes place when the button is pressed
      local args = {
    [1] = 0/0
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("StaminaService"):WaitForChild("RE"):WaitForChild("DecreaseStamina"):FireServer(unpack(args))  
   end,
})


    local Toggle = MainTab:CreateToggle({
   Name = "Auto grab football on release (when near) ",
   CurrentValue = false,
   Flag = "nosigma", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character.HumanoidRootPart
local head = character.Head
local humanoid = character.Humanoid
local playerStats = player:WaitForChild("PlayerStats")
local hasShot = playerStats:WaitForChild("HasShot")
local TweenService = game:GetService("TweenService")

local tweenSpeedForCatch = 0.2
local waitforacatchtime = 0.5
local scriptEnabled = true

local function tweenPlayerToBall(ball)
    if (humanoidRootPart.Position - ball.Position).Magnitude <= 25 then
        if ball.Position.Y >= head.Position.Y then
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            humanoid:Move(Vector3.new(0, 50, 0))
        end
        game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Dive:FireServer()
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://18694494525"
        humanoid:LoadAnimation(animation):Play()
        TweenService:Create(humanoidRootPart, TweenInfo.new(tweenSpeedForCatch), { CFrame = ball.CFrame }):Play()
    end
end

hasShot.Changed:Connect(function(value)
    if value == true then
        scriptEnabled = false
        task.wait(1)
        scriptEnabled = true
    end
end)

while task.wait(0) do
    if scriptEnabled then
        local ball = Workspace:FindFirstChild("Football") and Workspace.Football:FindFirstChild("Hitbox")
        if ball and (humanoidRootPart.Position - ball.Position).Magnitude <= 25 then
            tweenPlayerToBall(ball)
            task.wait(waitforacatchtime)
        end
    end
end
   end,
})
