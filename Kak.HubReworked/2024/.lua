-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ================ THE KAK.HUB REWORKED ==========================
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function LoadREALKakHubReworked()

    -- Age Of Heroes
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------

    if game.PlaceId == 4866692557 then

    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local TweenService = game:GetService("TweenService")
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Age Of Heroes)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "By Kak", IntroEnabled = false})
    
    local Tab = Window:MakeTab({
        Name = "Toggles",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local isPunching = false
    
    Tab:AddToggle({
        Name = "Toggle Automatic Punching",
        Default = false,
        Callback = function(Value)
            isPunching = Value
    
            if isPunching then
                task.spawn(function()
                    while isPunching do
                        local args = {
                            [1] = 0,
                            [2] = 0.1,
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Punch"):FireServer(unpack(args))
                        task.wait(0.1)
                    end
                end)
            end
        end    
    })
    
    local collecting = false
    
    Tab:AddToggle({
        Name = "Toggle Auto Collecting Orbs",
        Default = false,
        Callback = function(Value)
            if Value then
                collecting = true
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
                local function collectOrbs()
                    while collecting do
                        local orbs = game.Workspace.ExperienceOrbs:GetChildren()
                        
                        for _, orb in pairs(orbs) do
                            if orb.Name == "experienceOrb" then 
                                orb.CFrame = humanoidRootPart.CFrame
                                task.wait(0.0001)
                            end
                        end
                        
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Auto Collecting Orbs",
                            Text = "Orbs collected!"
                        })
    
                        wait(20)    
                    end
                end
    
                task.spawn(collectOrbs)
            else
                collecting = false
                print("Toggle is OFF! Orbs collecting stopped.")
            end
        end    
    })
    
    local farming = false
    
    Tab:AddToggle({
        Name = "Toggle Thug Farm",
        Default = false,
        Callback = function(Value)
            if Value then
                farming = true
                wait(1)
    
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
                local function startFarming()
                    while farming do
                        local thugs = game.Workspace:GetChildren()
                        local foundThug = false
    
                        for _, npc in pairs(thugs) do
                            if npc.Name == "Thug" and npc:FindFirstChild("UpperTorso") then
                                local upperTorso = npc:FindFirstChild("UpperTorso")
                                foundThug = true
                                
                                local targetCFrame = upperTorso.CFrame
                                
                                humanoidRootPart.CFrame = targetCFrame
                                
                                while upperTorso and upperTorso.Parent and upperTorso:IsDescendantOf(game.Workspace) and farming do
                                    humanoidRootPart.CFrame = upperTorso.CFrame
                                    wait(0.1)
                                end
                                break
                            end
                        end
    
                        if not foundThug then
                            wait(1)
                        end
                    end
                end
    
                task.spawn(startFarming)
            else
                farming = false
                print("Toggle is OFF! Thug farming stopped.")
            end
        end    
    })
    
    local farming = false
    
    Tab:AddToggle({
        Name = "Toggle Police Farm",
        Default = false,
        Callback = function(Value)
            if Value then
                farming = true
                wait(1)
    
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
                local function startFarming()
                    while farming do
                        local cops = game.Workspace:GetChildren()
                        local foundCops = false
    
                        for _, npc in pairs(cops) do
                            if npc.Name == "Police" and npc:FindFirstChild("UpperTorso") then
                                local upperTorso = npc:FindFirstChild("UpperTorso")
                                foundCops = true
                                
                                local targetCFrame = upperTorso.CFrame
                                
                                humanoidRootPart.CFrame = targetCFrame
                                
                                while upperTorso and upperTorso.Parent and upperTorso:IsDescendantOf(game.Workspace) and farming do
                                    humanoidRootPart.CFrame = upperTorso.CFrame
                                    wait(0.1)
                                end
                                break
                            end
                        end
    
                        if not foundCops then
                            wait(1)
                        end
                    end
                end
    
                task.spawn(startFarming)
            else
                farming = false
                print("Toggle is OFF! Thug farming stopped.")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)
    
    Tab:AddLabel("NPC ESP")
    
    local thugEspObjects = {}
    local policeEspObjects = {}
    
    local function createNPCESP(npcName, espTable)
        local localPlayer = game.Players.LocalPlayer
    
        for _, npc in pairs(game.Workspace:GetChildren()) do
            if npc.Name == npcName and npc:FindFirstChild("HumanoidRootPart") then
                local head = npc:FindFirstChild("Head")
                if head then
                    local billboardGui = Instance.new("BillboardGui")
                    billboardGui.Name = npcName .. "ESP"
                    billboardGui.Adornee = head
                    billboardGui.Size = UDim2.new(0, 100, 0, 25)
                    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                    billboardGui.AlwaysOnTop = true
    
                    local nameLabel = Instance.new("TextLabel", billboardGui)
                    nameLabel.Text = npcName
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true
    
                    local uiStroke = Instance.new("UIStroke", nameLabel)
                    uiStroke.Thickness = 2
                    uiStroke.Color = Color3.new(0, 0, 0)
    
                    local function updateDistance()
                        local character = localPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("HumanoidRootPart") then
                            local distance = (character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                            nameLabel.Text = npcName .. " [" .. math.floor(distance) .. " Studs]"
                        end
                    end                
    
                    game:GetService("RunService").RenderStepped:Connect(updateDistance)
                    billboardGui.Parent = head
    
                    espTable[npc] = billboardGui
                end
            end
        end
    end
    
    local function removeNPCESP(espTable)
        for _, esp in pairs(espTable) do
            if esp then
                esp:Destroy()
            end
        end
        table.clear(espTable)
    end
    
    Tab:AddToggle({
        Name = "(NPC) Toggle Thug ESP",
        Default = false,
        Callback = function(Value)
            if Value then
                createNPCESP("Thug", thugEspObjects)
                print("Thug ESP Enabled")
            else
                removeNPCESP(thugEspObjects)
                print("Thug ESP Disabled")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "(NPC) Toggle Police ESP",
        Default = false,
        Callback = function(Value)
            if Value then
                createNPCESP("Police", policeEspObjects)
                print("Police ESP Enabled")
            else
                removeNPCESP(policeEspObjects)
                print("Police ESP Disabled")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddDropdown({
        Name = "Select A Place To Teleport",
        Default = "",
        Options = {"Thug Base 1", "Thug Base 2", "Thug Base 3", "Thug Base 4", "Police Base 1", "Mid Place", "Ignite Tower", "Safezone 1", "Safezone 2", "Safezone 3"},
        Callback = function(Value)
            local teleportCFrame
            if Value == "Thug Base 1" then
                teleportCFrame = CFrame.new(-910.478394, 94.0982361, -984.467224, -0.524020791, 3.20457687e-08, 0.851705492, -2.6124698e-09, 1, -3.92327628e-08, -0.851705492, -2.2783837e-08, -0.524020791)
            elseif Value == "Thug Base 2" then
                teleportCFrame = CFrame.new(-1638.34241, 94.0979919, -1001.11951, 0.270555615, -6.03165375e-08, 0.96270436, -1.55995561e-09, 1, 6.30916333e-08, -0.96270436, -1.85715727e-08, 0.270555615)
            elseif Value == "Thug Base 3" then
                teleportCFrame = CFrame.new(776.079407, 94.0982361, -483.92984, 0.00294004218, 4.16436343e-08, -0.999995649, -8.99492369e-10, 1, 4.16411687e-08, 0.999995649, 7.77061637e-10, 0.00294004218)
            elseif Value == "Thug Base 4" then
                teleportCFrame = CFrame.new(33.4100647, 94.0982361, 254.455063, -0.999987185, -6.27026708e-10, -0.0050648246, -7.60546959e-10, 1, 2.63603379e-08, 0.0050648246, 2.63638515e-08, -0.999987185)
            elseif Value == "Police Base 1" then
                teleportCFrame = CFrame.new(-69.2359161, 94.0982361, -485.755249, 0.902980447, -3.51664631e-09, -0.429681599, 4.06393461e-08, 1, 7.72197097e-08, 0.429681599, -8.71898678e-08, 0.902980447)
            elseif Value == "Mid Place" then
                teleportCFrame = CFrame.new(-390.910309, 85.6083755, 246.049408, 0.998792708, 3.31344587e-08, -0.0491238795, -2.95534281e-08, 1, 7.36242853e-08, 0.0491238795, -7.20836226e-08, 0.998792708)
            elseif Value == "Ignite Tower" then
                teleportCFrame = CFrame.new(-73.3086624, 616.339539, -242.797745, -0.859128714, 2.51383447e-09, 0.51175952, -6.36977859e-10, 1, -5.98148198e-09, -0.51175952, -5.4648428e-09, -0.859128714)
            elseif Value == "Safezone 1" then
                teleportCFrame = CFrame.new(-346.131134, 94.1082535, 85.0535812, -0.0264436733, -3.10670406e-10, 0.9996503, 5.59640216e-11, 1, 3.12259496e-10, -0.9996503, 6.42017411e-11, -0.0264436733)
            elseif Value == "Safezone 2" then
                teleportCFrame = CFrame.new(-899.698547, 94.2114716, -1092.0083, 0.776987731, -5.18992138e-08, -0.629515767, 7.97438204e-08, 1, 1.59817386e-08, 0.629515767, -6.26176089e-08, 0.776987731)
            elseif Value == "Safezone 3" then
                teleportCFrame = CFrame.new(-1742.70898, 94.3633423, -1355.52087, 0.0784801841, -8.33553955e-08, 0.996915698, -4.80632316e-08, 1, 8.73969697e-08, -0.996915698, -5.47739205e-08, 0.0784801841)
            end
            
            if teleportCFrame then
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CFrame = teleportCFrame
                else
                    warn("HumanoidRootPart not found!")
                end
            end
        end    
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddTextbox({
        Name = "Fake Level",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local leaderstats = player:FindFirstChild("leaderstats")
    
            if leaderstats then
                local level = leaderstats:FindFirstChild("Level")
                if level then
                    level.Value = Value
                    print("Level set to:", level.Value)
                else
                    print("Level stat not found.")
                end
            else
                print("leaderstats not found for player.")
            end
        end	  
    })
    
    Tab:AddTextbox({
        Name = "Fake Title",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local leaderstats = player:FindFirstChild("leaderstats")
    
            if leaderstats then
                local level = leaderstats:FindFirstChild("Title")
                if level then
                    level.Value = Value
                    print("Level set to:", level.Value)
                else
                    print("Level stat not found.")
                end
            else
                print("leaderstats not found for player.")
            end
        end	  
    })
    
    Tab:AddTextbox({
        Name = "Fake Reputation",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local leaderstats = player:FindFirstChild("leaderstats")
    
            if leaderstats then
                local level = leaderstats:FindFirstChild("Reputation")
                if level then
                    level.Value = Value
                    print("Level set to:", level.Value)
                else
                    print("Level stat not found.")
                end
            else
                print("leaderstats not found for player.")
            end
        end	  
    })
    
    Tab:AddTextbox({
        Name = "Fake Money",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local leaderstats = player:FindFirstChild("leaderstats")
    
            if leaderstats then
                local level = leaderstats:FindFirstChild("Money")
                if level then
                    level.Value = Value
                    print("Level set to:", level.Value)
                else
                    print("Level stat not found.")
                end
            else
                print("leaderstats not found for player.")
            end
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Local Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Keybinds",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Mobile Keyboard (Not made by me)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GGH52lan/GGH52lan/main/keyboard.txt"))()
          end    
    })
    
    Tab:AddBind({
        Name = "Toggle Orion With Keybind",
        Default = Enum.KeyCode.T,
        Hold = false,
        Callback = function(Value)
        local orionGui = game:GetService("CoreGui"):FindFirstChild("Orion")
            if orionGui then
                orionGui.Enabled = not orionGui.Enabled
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    -- Build A Boat For Treasure
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 537413528 then
    
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local TS = game:GetService("TweenService")
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Build A Boat For Treasure)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "By Kak", IntroEnabled = false})
    
    local Tab = Window:MakeTab({
        Name = "Farms",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local toggleActive = false
    
    Tab:AddToggle({
        Name = "Farm With Tweening (Recommended)",
        Default = false,
        Callback = function(Value)
            toggleActive = Value
            if toggleActive then
                startTweenFarm()
            end
        end    
    })
    
    function FarmStopNotification()
    
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Plese Wait!",
            Text = "Farm is being stopped.",
        })
    
    end
    
    function startTweenFarm()
        spawn(function()
            while toggleActive do
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    
                if humanoidRootPart then
                    local tween1 = TS:Create(humanoidRootPart, TweenInfo.new(0.1), {CFrame = CFrame.new(-49.838829, -9.82197094, -494.886627, -0.999990225, 4.20346175e-10, -0.00442359503, 2.78783163e-10, 1, 3.2002422e-08, 0.00442359503, 3.20008766e-08, -0.999990225)})
                    tween1:Play()
                    
                    wait(1)
    
                    local tween2 = TS:Create(humanoidRootPart, TweenInfo.new(15), {CFrame = CFrame.new(-53.5656586, 120.801163, 8819.34863, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
                    tween2:Play()
    
                    wait(16)
    
                    local tween3 = TS:Create(humanoidRootPart, TweenInfo.new(1.5), {CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)})
                    tween3:Play()
    
                    wait(20)
                else
                    break
                end
            end
        end)
    end
    
    local toggleActive = false
    
    Tab:AddToggle({
        Name = "Farm With Teleporting",
        Default = false,
        Callback = function(Value)
            toggleActive = Value
            if toggleActive then
                startTeleportFarm()
            else
                print("Farm Stopped")
            end
        end    
    })
    
    function startTeleportFarm()
        spawn(function()
            while toggleActive do
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    
                if humanoidRootPart then
    
                    humanoidRootPart.CFrame = CFrame.new(-49.8328743, -9.90196896, -197.83371, -0.999451101, -8.02251687e-09, 0.0331289843, -9.66826441e-09, 1, -4.95167782e-08, -0.0331289843, -4.98098984e-08, -0.999451101)
                    wait(1)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 1369.09009, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 2139.09009, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 2909.09009, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-53.5660019, 70.8500137, 3677.94214, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 4449.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 5219.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 5989.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 6759.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 7529.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51.5656433, 65.0000458, 8299.08984, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                    wait(20)
                else
                    break
                end
            end
        end)
    end
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)
    
    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Teleport Part")
    
    local player = game.Players.LocalPlayer
    
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local teamCFrames = {
        ["White Team"] = CFrame.new(-49.838829, -9.82197094, -494.886627, -0.999990225, 4.20346175e-10, -0.00442359503, 2.78783163e-10, 1, 3.2002422e-08, 0.00442359503, 3.20008766e-08, -0.999990225),
        ["Red Team"] = CFrame.new(371.230713, -9.82197094, -65.0791092, -0.00158596516, 6.04473058e-08, 0.999998748, -8.82587017e-08, 1, -6.05873538e-08, -0.999998748, -8.83546747e-08, -0.00158596516),
        ["Blue Team"] = CFrame.new(372.12323, -9.74197483, 299.957977, -0.00401287153, -4.03143048e-08, 0.999991953, 7.37563388e-09, 1, 4.03442257e-08, -0.999991953, 7.53747109e-09, -0.00401287153),
        ["Pink Team"] = CFrame.new(371.752502, -9.78197384, 646.99292, 0.00518693775, -7.85978784e-08, 0.999986529, 3.36967121e-10, 1, 7.85971892e-08, -0.999986529, -7.07161413e-11, 0.00518693775),
        ["Black Team"] = CFrame.new(-479.382324, -9.74197674, -69.0946121, -0.0053190235, -4.55828904e-08, -0.999985874, 7.11277204e-10, 1, -4.5587317e-08, 0.999985874, -9.53747192e-10, -0.0053190235),
        ["Green Team"] = CFrame.new(-479.71109, -9.70197773, 293.66156, 0.00975389406, -9.26856671e-08, -0.999952435, -1.75495032e-08, 1, -9.28612565e-08, 0.999952435, 1.84544273e-08, 0.00975389406),
        ["Yellow Team"] = CFrame.new(-479.78009, -9.70197773, 640.882202, 0.0123651186, 3.22970841e-08, -0.999923527, -3.7356136e-09, 1, 3.22533573e-08, 0.999923527, 3.33651129e-09, 0.0123651186)
    }
    
    Tab:AddDropdown({
        Name = "Chose A Team To Teleport",
        Default = "",
        Options = {"White Team", "Red Team", "Blue Team", "Pink Team", "Black Team", "Green Team", "Yellow Team"},
        Callback = function(currentOption)
            local targetCFrame = teamCFrames[currentOption]
            if targetCFrame then
                humanoidRootPart.CFrame = targetCFrame
                print("Teleported to " .. currentOption)
            else
                print("No CFrame found for the selected team.")
            end
        end
    })
    
    local Players = game:GetService("Players")
    
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    
    Tab:AddDropdown({
        Name = "Choose A Player To Teleport",
        Default = "",
        Options = playerNames,
        Callback = function(selectedPlayerName)
            local localPlayer = Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character then
                local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart then
                    humanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
                    print("Teleported to " .. selectedPlayerName)
                else
                    print("Target player's HumanoidRootPart not found.")
                end
            else
                print("Selected player not found.")
            end
        end    
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddTextbox({
        Name = "Fake Gold",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            local localPlayer = game.Players.LocalPlayer
            local newValue = tonumber(Value)
            if newValue then
                localPlayer.PlayerGui.GoldGui.Frame.Amount.Text = tostring(newValue)
            else
                print("Please Enter A Number.")
            end
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Local Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    -- SPTS:Modded
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 15786769057 then
    
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (SPTS:Modded)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false,})
    
    local Tab = Window:MakeTab({
        Name = "Buttons",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local lastDeathPosition = nil
    local player = game.Players.LocalPlayer
    
    local function trackDeathPosition()
        if player.Character then
            local character = player.Character
            local humanoid = character:WaitForChild("Humanoid")
            
            humanoid.Died:Connect(function()
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    lastDeathPosition = rootPart.Position
                end
            end)
        end
    end
    
    player.CharacterAdded:Connect(function()
        trackDeathPosition()
    end)
    
    if player.Character then
        trackDeathPosition()
    end
    
    Tab:AddButton({
        Name = "Teleport To Last Death Location",
        Callback = function()
            if lastDeathPosition then
                local character = player.Character or player.CharacterAdded:Wait()
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.CFrame = CFrame.new(lastDeathPosition)
                end
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Load StatsGui",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/WZGr7Y7f/raw"))()
          end    
    })
    
    local Tab = Window:MakeTab({
        Name = "For AFK",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local IsAutoFist = false
    
    Tab:AddButton({
        Name = "Auto Fist",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
    
            local tool = backpack:FindFirstChild("1A Fist Training")
            
            if tool then
                player.Character.Humanoid:EquipTool(tool)
                
                IsAutoFist = true
                while IsAutoFist do
                    tool:Activate()	
                    wait(0.5)
                end
            else
                warn("1A Fist Training tool not found in the backpack.")
            end
        end    
    })
    
    Tab:AddButton({
        Name = "STOP Auto Fist",
        Callback = function()
            IsAutoFist = false
            print("Tool stopped.")
        end    
    })
    
    local IsAutoBody = false
    
    Tab:AddButton({
        Name = "Auto Body Toughness",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
    
            local tool = backpack:FindFirstChild("6C Push Up")
            
            if tool then
                player.Character.Humanoid:EquipTool(tool)
                
                IsAutoBody = true
                while IsAutoBody do
                    tool:Activate()
                    wait(0.5)
                end
            else
                warn("6C Push Up tool not found in the backpack.")
            end
        end    
    })
    
    Tab:AddButton({
        Name = "STOP Body Toughness",
        Callback = function()
            IsAutoBody = false
            print("Tool stopped.")
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Psychic Power",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
    
            local tool = backpack:FindFirstChild("3B Meditate")
            
            if tool then
                player.Character.Humanoid:EquipTool(tool)
    
            else
                warn("3B Meditate tool not found in the backpack.")
            end
        end
    })
    
    local autoWalkEnabled = false
    local isJumping = false
    
    Tab:AddToggle({
        Name = "Auto Walk Character",
        Default = false,
        Callback = function(value)
            autoWalkEnabled = value
            if autoWalkEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
    
                local sideLength = 10
                local step = 1
    
                while autoWalkEnabled do
                    if step == 1 then
                        local forwardPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(forwardPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 2
    
                    elseif step == 2 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local rightPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(rightPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 3
    
                    elseif step == 3 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local backPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(backPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 4
    
                    elseif step == 4 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local leftPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(leftPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 2
                    end
    
                    wait(0.1)
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Auto Jump Character",
        Default = false,
        Callback = function(value)
            isJumping = value
            if isJumping then
                while isJumping do
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    wait(1)
                end
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "Autos",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local AutoFist = false
    
    Tab:AddToggle({
        Name = "Turn On|Off Auto Fist Power",
        Default = false,
        Callback = function(Value)
            AutoFist = Value
            
            if AutoFist then
                spawn(function()
                    while AutoFist do
                        local args = {
                            [1] = {
                                [1] = "+FS1"
                            }
                        }
    
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                        
                        wait(0.1)
                    end
                end)
            end
        end    
    })
    
    local AutoBodyToughness = false
    
    Tab:AddToggle({
        Name = "Turn On|Off Auto Body Toughness",
        Default = false,
        Callback = function(Value)
            AutoBodyToughness = Value
    
            if AutoBodyToughness then
                spawn(function()
                    while AutoBodyToughness do
                        local args = {
                            [1] = {
                                [1] = "+BT1"
                            }
                        }
    
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    
                        wait(0.1)
                    end
                end)
            end
        end    
    })
    
    local AutoPsychic = false
    
    Tab:AddToggle({
        Name = "Turn On|Off Auto Psychic Power",
        Default = false,
        Callback = function(Value)
            AutoPsychic = Value
            
            if AutoPsychic then
                spawn(function()
                    while AutoPsychic do
                        local args = {
                            [1] = {
                                [1] = "+PP1"
                            }
                        }
    
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                        
                        wait(0.1)
                    end
                end)
            end
        end
    })
    
    local AutoMovementSpeed = false
    
    Tab:AddToggle({
        Name = "Turn On|Off Auto Movement Speed",
        Default = false,
        Callback = function(Value)
            AutoMovementSpeed = Value
            
            if AutoMovementSpeed then
                spawn(function()
                    while AutoMovementSpeed do
                        local args = {
                            [1] = {
                                [1] = "+MS1"
                            }
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))                    
                        
                        wait(0.1)
                    end
                end)
            end
        end
    })
    
    local AutoJumpAbility = false
    
    Tab:AddToggle({
        Name = "Turn On|Off Auto Jump Force",
        Default = false,
        Callback = function(Value)
            AutoJumpAbility = Value
            
            if AutoJumpAbility then
                spawn(function()
                    while AutoJumpAbility do
                        local args = {
                            [1] = {
                                [1] = "+JF1"
                            }
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))                                        
                        
                        wait(0.1)
                    end
                end)
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)
    
    local Tab = Window:MakeTab({
        Name = "Upgrades",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Upgrade Fist Strenght",
        Callback = function()
    
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Upgraded!",
                Text = "Upgraded the fist strenght. Check your fist strenght multiplier.",
                Duration = 10
            })
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Multipliers"):WaitForChild("UpgradeFS"):FireServer(unpack(args))
            
          end    
    })
    
    Tab:AddButton({
        Name = "Upgrade Body Toughness",
        Callback = function()
    
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Upgraded!",
                Text = "Upgraded the body toughness. Check your body toughness multiplier.",
                Duration = 10
            })
    
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Multipliers"):WaitForChild("UpgradeBT"):FireServer(unpack(args))        
            
          end    
    })
    
    Tab:AddButton({
        Name = "Upgrade Movement Speed",
        Callback = function()
    
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Upgraded!",
                Text = "Upgraded the movement speed. Check your movement speed multiplier.",
                Duration = 10
            })
    
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Multipliers"):WaitForChild("UpgradeMS"):FireServer(unpack(args))                
            
          end    
    })
    
    Tab:AddButton({
        Name = "Upgrade Jump Force",
        Callback = function()
    
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Upgraded!",
                Text = "Upgraded the jump force. Check your jump force multiplier.",
                Duration = 10
            })
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Multipliers"):WaitForChild("UpgradeJF"):FireServer(unpack(args))                        
            
          end    
    })
    
    Tab:AddButton({
        Name = "Upgrade Psychic Power",
        Callback = function()
    
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Upgraded!",
                Text = "Upgraded the psychic power. Check your psychic power multiplier.",
                Duration = 10
            })
    
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }   
            
            game:GetService("ReplicatedStorage"):WaitForChild("Multipliers"):WaitForChild("UpgradePP"):FireServer(unpack(args))                                
            
          end    
    })
    
    local Tab = Window:MakeTab({
        Name = "Teleporters",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local Players = game:GetService("Players")
    
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    
    Tab:AddDropdown({
        Name = "Choose A Player To Teleport",
        Default = "",
        Options = playerNames,
        Callback = function(selectedPlayerName)
            local localPlayer = Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character then
                local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHumanoidRootPart then
                    humanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
                    print("Teleported to " .. selectedPlayerName)
                else
                    print("Target player's HumanoidRootPart not found.")
                end
            else
                print("Selected player not found.")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "Useless Tab",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Choose A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "LocalPlayer",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    -- Hide And Seek Extreme
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 205224386 then
    
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Hide And Seek Extreme)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})
    
    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Catch All Players",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
    
            for _, targetPlayer in ipairs(game.Players:GetPlayers()) do
                if targetPlayer ~= player and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    
                    character:SetPrimaryPartCFrame(targetCFrame + Vector3.new(0, 3, 0))
    
                    wait(1)
                end
            end
          end    
    })
    
    local autoCollect = false
    local player = game.Players.LocalPlayer
    local noCreditsNotified = false
    
    Tab:AddToggle({
        Name = "Collect All Credits Automatically",
        Default = false,
        Callback = function(Value)
            autoCollect = Value
            if autoCollect then
                print("Auto Collect Credits is ON")
                local character = player.Character or player.CharacterAdded:Wait()
                local torso = character:WaitForChild("UpperTorso")
                
                local function collectCredits()
                    while autoCollect do
                        local credits = game.Workspace.GameObjects:GetChildren()
                        local foundCredits = false
                        
                        for _, obj in pairs(credits) do
                            if obj.Name == "Credit" then
                                foundCredits = true
                                noCreditsNotified = false
                                obj.CFrame = torso.CFrame + Vector3.new(0, 0, -2)
                            end
                        end
                        
                        if not foundCredits and not noCreditsNotified then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Notification!",
                                Text = "All credits has been collected."
                            })
                            noCreditsNotified = true
                        end
    
                        wait(0.5)
                    end
                end
                
                spawn(collectCredits)
            else
                print("Auto Collect Credits is OFF")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)
    
    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddDropdown({
        Name = "Select A Place To Teleport",
        Default = "",
        Options = {"Thug Base 1", "Thug Base 2", "Thug Base 3", "Thug Base 4", "Police Base 1", "Mid Place", "Ignite Tower", "Safezone 1", "Safezone 2", "Safezone 3"},
        Callback = function(Value)
            local teleportCFrame
            if Value == "Thug Base 1" then
                teleportCFrame = CFrame.new(-910.478394, 94.0982361, -984.467224, -0.524020791, 3.20457687e-08, 0.851705492, -2.6124698e-09, 1, -3.92327628e-08, -0.851705492, -2.2783837e-08, -0.524020791)
            elseif Value == "Thug Base 2" then
                teleportCFrame = CFrame.new(-1638.34241, 94.0979919, -1001.11951, 0.270555615, -6.03165375e-08, 0.96270436, -1.55995561e-09, 1, 6.30916333e-08, -0.96270436, -1.85715727e-08, 0.270555615)
            elseif Value == "Thug Base 3" then
                teleportCFrame = CFrame.new(776.079407, 94.0982361, -483.92984, 0.00294004218, 4.16436343e-08, -0.999995649, -8.99492369e-10, 1, 4.16411687e-08, 0.999995649, 7.77061637e-10, 0.00294004218)
            elseif Value == "Thug Base 4" then
                teleportCFrame = CFrame.new(33.4100647, 94.0982361, 254.455063, -0.999987185, -6.27026708e-10, -0.0050648246, -7.60546959e-10, 1, 2.63603379e-08, 0.0050648246, 2.63638515e-08, -0.999987185)
            elseif Value == "Police Base 1" then
                teleportCFrame = CFrame.new(-69.2359161, 94.0982361, -485.755249, 0.902980447, -3.51664631e-09, -0.429681599, 4.06393461e-08, 1, 7.72197097e-08, 0.429681599, -8.71898678e-08, 0.902980447)
            elseif Value == "Mid Place" then
                teleportCFrame = CFrame.new(-390.910309, 85.6083755, 246.049408, 0.998792708, 3.31344587e-08, -0.0491238795, -2.95534281e-08, 1, 7.36242853e-08, 0.0491238795, -7.20836226e-08, 0.998792708)
            elseif Value == "Ignite Tower" then
                teleportCFrame = CFrame.new(-73.3086624, 616.339539, -242.797745, -0.859128714, 2.51383447e-09, 0.51175952, -6.36977859e-10, 1, -5.98148198e-09, -0.51175952, -5.4648428e-09, -0.859128714)
            elseif Value == "Safezone 1" then
                teleportCFrame = CFrame.new(-346.131134, 94.1082535, 85.0535812, -0.0264436733, -3.10670406e-10, 0.9996503, 5.59640216e-11, 1, 3.12259496e-10, -0.9996503, 6.42017411e-11, -0.0264436733)
            elseif Value == "Safezone 2" then
                teleportCFrame = CFrame.new(-899.698547, 94.2114716, -1092.0083, 0.776987731, -5.18992138e-08, -0.629515767, 7.97438204e-08, 1, 1.59817386e-08, 0.629515767, -6.26176089e-08, 0.776987731)
            elseif Value == "Safezone 3" then
                teleportCFrame = CFrame.new(-1742.70898, 94.3633423, -1355.52087, 0.0784801841, -8.33553955e-08, 0.996915698, -4.80632316e-08, 1, 8.73969697e-08, -0.996915698, -5.47739205e-08, 0.0784801841)
            end
            
            if teleportCFrame then
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CFrame = teleportCFrame
                else
                    warn("HumanoidRootPart not found!")
                end
            end
        end    
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Local Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })

    -- SPTS
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------

    elseif game.PlaceId == 12798970675 then
        
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Super Power Training Simulator)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})

    local Tab = Window:MakeTab({
        Name = "For AFK",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local IsAutoFist = false

    Tab:AddToggle({
        Name = "Auto Fist",
        Default = false,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            IsAutoFist = Value
    
            if Value then
                local tool = backpack:FindFirstChild("Fist Training")
                if tool then
                    player.Character.Humanoid:EquipTool(tool)
                    coroutine.wrap(function()
                        while IsAutoFist do
                            tool:Activate()
                            wait(0.5)
                        end
                    end)()
                else
                    warn("Fist Training tool not found in the backpack.")
                end
            else
                print("Auto Fist Disabled")
            end
        end
    })

    local IsAutoBody = false
    
    Tab:AddToggle({
        Name = "Auto Body Toughness",
        Default = false,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            IsAutoBody = Value
    
            if Value then
                local tool = backpack:FindFirstChild("Push Up")
                if tool then
                    player.Character.Humanoid:EquipTool(tool)
                    coroutine.wrap(function()
                        while IsAutoBody do
                            tool:Activate()
                            wait(0.5)
                        end
                    end)()
                else
                    warn("Push Up tool not found in the backpack.")
                end
            else
                print("Auto Body Toughness Disabled")
            end
        end
    })    
    
    Tab:AddButton({
        Name = "Auto Psychic Power",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
    
            local tool = backpack:FindFirstChild("Meditate")
            
            if tool then
                player.Character.Humanoid:EquipTool(tool)
    
            else
                warn("3B Meditate tool not found in the backpack.")
            end
        end
    })
    
    local autoWalkEnabled = false
    local isJumping = false
    
    Tab:AddToggle({
        Name = "Auto Walk Character",
        Default = false,
        Callback = function(value)
            autoWalkEnabled = value
            if autoWalkEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
    
                local sideLength = 10
                local step = 1
    
                while autoWalkEnabled do
                    if step == 1 then
                        local forwardPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(forwardPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 2
    
                    elseif step == 2 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local rightPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(rightPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 3
    
                    elseif step == 3 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local backPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(backPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 4
    
                    elseif step == 4 then
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0))
                        local leftPosition = character.PrimaryPart.Position + (character.PrimaryPart.CFrame.LookVector * sideLength)
                        humanoid:MoveTo(leftPosition)
                        humanoid.MoveToFinished:Wait()
                        step = 2
                    end
    
                    wait(0.1)
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Auto Jump Character",
        Default = false,
        Callback = function(value)
            isJumping = value
            if isJumping then
                while isJumping do
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    wait(1)
                end
            end
        end    
    })

    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })

    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)

    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })

    -- Lifting Simulator
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 3652625463 then
    
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Lifting Simulator)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})
    
    local Tab = Window:MakeTab({
        Name = "Automatics",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local itemNames = {
        "Pencil", "Stick", "Mouse", "Water Bottle", "Soccer Ball", "Bottle", 
        "Textbook", "Bucket", "Wood", "Guitar", "Chair", "Shopping Cart", 
        "TV", "Bicycle", "Desk", "Bed", "Log", "Canoe", "Tire", "Refrigerator", 
        "Drum", "Hydrant", "Piano", "Motorcycle", "Safe", "Flag", "ATM", 
        "RX-7", "EVO", "G-Class", "Van", "Tree", "Container", "Sailboat", 
        "Bus", "Truck", "Windmill", "Jet", "Tank", "Transport Helicopter", 
        "Battleship", "Spaceship", "Speaker", "Anchor", "Old House", "Apartment", 
        "Toxic Tank", "Rocket", "Castle", "Torpedo", "Signal Tower", "Stone Altar", 
        "UFO", "Ancient Place", "Pyramid", "Canyon Mt", "Mountain", "Volcano", 
        "Mount Fuji", "Meteorite", "Moon", "Mercury", "Mars", "Saturn", "Jupiter", 
        "Super Saturn", "Sedna Bar", "Sun", "Mini Galaxy", "Earth Bar", "Black Hole", 
        "Four Dimensions", "Sun Bar", "Holy Star", "Meteoroids Ring", "Meteor Bar", 
        "Water Sphere", "Super Meteorite", "Cross Stars", "Fiery Star", "Super Venus", 
        "Atomic Suns", "Lightning Cube", "Atmosphere", "Five Dimensions", "Space Stone", 
        "Universe", "Mind Stone", "Reality Stone", "Soul Stone", "Time Stone", 
        "Power Stone", "Cosmo Bar", "Galaxy Bar", "Universe Bar", "Sharkupiter", 
        "Giftune", "Aurora Way", "Eternity", "Cashensione", "Past", "Future", "Infection", 
        "Mutation", "Godly 1st class", "Godly 2nd class", "Godly 3rd class", "Godly 4th class", 
        "Godly 5th class", "Godly 6th class", "Godly 7th class", "Godly 8th class", "Godly 9th class", 
        "Super 1st class", "Super 2nd class", "Super 3rd class", "Super 4th class", "Super 5th class", 
        "Super 6th class", "Super 7th class", "Super 8th class", "Super 9th class", "Super 10th class", 
        "Super 11th class", "Ultimate 1st class", "Ultimate 2nd class", "Ultimate 3rd class", 
        "Ultimate 4th class", "Ultimate 5th class", "Ultimate 6th class", "Ultimate 7th class", 
        "Ultimate 8th class", "Ultimate 9th class", "1st supreme class", "2nd supreme class", 
        "3rd supreme class", "4th supreme class", "5th supreme class", "6th supreme class", 
        "7th supreme class", "8th supreme class", "9th supreme class", "Ultimate supreme class"
    }
    
    local thirdTool = nil
    local IsAutoBody = false
    
    local function startAutoLifting()
        if thirdTool then
            IsAutoBody = true
            while IsAutoBody do
                thirdTool:Activate()
                wait(1)
            end
        end
    end
    
    local function stopAutoLifting()
        IsAutoBody = false
    end
    
    Tab:AddToggle({
        Name = "Auto Lift Weight",
        Default = false,
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    for _, itemName in ipairs(itemNames) do
                        if tool.Name == itemName then
                            thirdTool = tool
                            break
                        end
                    end
                end
            end
            
            if thirdTool then
                player.Character.Humanoid:EquipTool(thirdTool)
    
                if Value then
                    startAutoLifting()
                else
                    stopAutoLifting()
                end
            else
                warn("Üçüncü tool bulunamadı.")
            end
        end    
    })
    
    local Tab = Window:MakeTab({
        Name = "Toggles",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local AutoLifting = false
    
    Tab:AddToggle({
        Name = "Toggle Auto Lifting",
        Default = false,
        Callback = function(Value)
            AutoLifting = Value
            
            if AutoLifting then
                spawn(function()
                    while AutoLifting do
                        local args = {
                            [1] = {
                                [1] = "GainMuscle"
                            }
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))                                        
                        
                        wait(0.1)
                    end
                end)
            end
        end
    })
    
    local AutoSell = false
    
    Tab:AddToggle({
        Name = "Toggle Auto Sell",
        Default = false,
        Callback = function(Value)
            AutoSell = Value
            
            if AutoSell then
                spawn(function()
                    while AutoSell do
                        local args = {
                            [1] = {
                                [1] = "SellMuscle"
                            }
                        }
                        
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))                                                            
                        
                        wait(0.1)
                    end
                end)
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Buttons",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local itemNames = {
        "Pencil", "Stick", "Mouse", "Water Bottle", "Soccer Ball", "Bottle", 
        "Textbook", "Bucket", "Wood", "Guitar", "Chair", "Shopping Cart", 
        "TV", "Bicycle", "Desk", "Bed", "Log", "Canoe", "Tire", "Refrigerator", 
        "Drum", "Hydrant", "Piano", "Motorcycle", "Safe", "Flag", "ATM", 
        "RX-7", "EVO", "G-Class", "Van", "Tree", "Container", "Sailboat", 
        "Bus", "Truck", "Windmill", "Jet", "Tank", "Transport Helicopter", 
        "Battleship", "Spaceship", "Speaker", "Anchor", "Old House", "Apartment", 
        "Toxic Tank", "Rocket", "Castle", "Torpedo", "Signal Tower", "Stone Altar", 
        "UFO", "Ancient Place", "Pyramid", "Canyon Mt", "Mountain", "Volcano", 
        "Mount Fuji", "Meteorite", "Moon", "Mercury", "Mars", "Saturn", "Jupiter", 
        "Super Saturn", "Sedna Bar", "Sun", "Mini Galaxy", "Earth Bar", "Black Hole", 
        "Four Dimensions", "Sun Bar", "Holy Star", "Meteoroids Ring", "Meteor Bar", 
        "Water Sphere", "Super Meteorite", "Cross Stars", "Fiery Star", "Super Venus", 
        "Atomic Suns", "Lightning Cube", "Atmosphere", "Five Dimensions", "Space Stone", 
        "Universe", "Mind Stone", "Reality Stone", "Soul Stone", "Time Stone", 
        "Power Stone", "Cosmo Bar", "Galaxy Bar", "Universe Bar", "Sharkupiter", 
        "Giftune", "Aurora Way", "Eternity", "Cashensione", "Past", "Future", "Infection", 
        "Mutation", "Godly 1st class", "Godly 2nd class", "Godly 3rd class", "Godly 4th class", 
        "Godly 5th class", "Godly 6th class", "Godly 7th class", "Godly 8th class", "Godly 9th class", 
        "Super 1st class", "Super 2nd class", "Super 3rd class", "Super 4th class", "Super 5th class", 
        "Super 6th class", "Super 7th class", "Super 8th class", "Super 9th class", "Super 10th class", 
        "Super 11th class", "Ultimate 1st class", "Ultimate 2nd class", "Ultimate 3rd class", 
        "Ultimate 4th class", "Ultimate 5th class", "Ultimate 6th class", "Ultimate 7th class", 
        "Ultimate 8th class", "Ultimate 9th class", "1st supreme class", "2nd supreme class", 
        "3rd supreme class", "4th supreme class", "5th supreme class", "6th supreme class", 
        "7th supreme class", "8th supreme class", "9th supreme class", "Ultimate supreme class"
    }
    
    local function buyAllWeights()
        for index, itemName in ipairs(itemNames) do
            local args = {
                [1] = {
                    [1] = "BuyItem",
                    [2] = "Income_Item",
                    [3] = itemName,
                    [4] = index
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
    
    Tab:AddButton({
        Name = "Buy All Weights",
        Callback = function()
            buyAllWeights()
            print("All Weights purchased!")
        end
    })
    
    local geneticsItems = {
        "Kid",
        "Adult",
        "Donkey",
        "Horse",
        "Crocodile",
        "Zebra",
        "Tiger",
        "Lion (VIP)",
        "Ostrich",
        "Giraffe",
        "Bear",
        "Rhino",
        "Great Shark",
        "Elephant",
        "T-Rex",
        "Hydra",
        "Minotaur",
        "Cyclops",
        "Chimera",
        "Typhon",
        "King Kong",
        "Livyatan",
        "Mosasaurus",
        "Megalodon",
        "Blue Whale",
        "Kraken",
        "Leviathan",
        "Dirt",
        "Ice",
        "Sand",
        "Grass",
        "Aqua",
        "Cloud",
        "Liquid",
        "Manganese",
        "Cobalt",
        "Kryptonite",
        "Air",
        "Energy",
        "Light",
        "Quantum",
        "Dark Matter",
        "Star",
        "Solar System",
        "Sombrero",
        "Milky Way",
        "Magellana",
        "Andromeda",
        "Triangulum",
        "IC 1101",
        "Universe",
        "First layer DxD",
        "Second layer DxD",
        "Third layer DxD",
        "Fourth layer DxD",
        "Fifth layer DxD",
        "Sixth layer DxD",
        "Seventh Layer DxD",
        "Eighth Layer DxD",
        "Ninth Layer DxD",
        "Tenth Layer DxD",
        "11th Layer DxD",
        "12th Layer DxD",
        "13th Layer DxD",
        "14th Layer",
        "15th Layer",
        "16th Layer",
        "17th Layer",
        "18th Layer",
        "19th Layer",
        "20th Layer"
    }
    
    local function buyAllGens()
        for index, geneticsItems in ipairs(geneticsItems) do
            local args = {
                [1] = {
                    [1] = "BuyItem",
                    [2] = "Bag_Item",
                    [3] = geneticsItems,
                    [4] = index
                }
            }
    
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
    
    Tab:AddButton({
        Name = "Buy All Genetics",
        Callback = function()
            buyAllGens()
            print("All items purchased!")
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)

    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    -- Legends Of Speed
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 3101667897 then
    
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Legends Of Speed)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "By Kak", IntroEnabled = false})
    
    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Gem/Step/XP",
        Callback = function()
              while true do
    
                local args = {
                    [1] = "collectOrb",
                    [2] = "Red Orb",
                    [3] = "City"
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
    
                local args = {
                    [1] = "collectOrb",
                    [2] = "Gem",
                    [3] = "City"
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
                
                wait(0.1)
            end
          end    
    })
    
    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)

    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    Tab:AddLabel("TP Part")

    local teleportLocations = {
        ["City"] = CFrame.new(-753.824402, 4.1768651, 549.088013, 0.642763257, 3.68854884e-08, -0.766064882, -6.25115604e-08, 1, -4.30074154e-09, 0.766064882, 5.06522682e-08, 0.642763257),
        ["Snow City"] = CFrame.new(-866.386841, 4.1768651, 2165.70654, -0.499959469, -1.05595399e-09, -0.866048813, 6.8828534e-08, 1, -4.09531538e-08, 0.866048813, -8.00837867e-08, -0.499959469),
        ["Magma City"] = CFrame.new(1616.82703, 4.2268734, 4330.65234, 3.31788142e-15, 4.67652717e-09, -1, -9.81482557e-08, 1, 4.67652717e-09, 1, 9.81482557e-08, 3.77687417e-15),
        ["Legends Highway"] = CFrame.new(3681.57275, 71.70681, 5595.7627, -0.0498838127, -7.95954769e-09, -0.998755038, 2.95820723e-09, 1, -8.11722067e-09, 0.998755038, -3.35944228e-09, -0.0498838127)
    }
    
    Tab:AddDropdown({
        Name = "Chose A Island To Teleport",
        Default = "",
        Options = {"City", "Snow City", "Magma City", "Legends Highway"},
        Callback = function(Value)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
            local targetCFrame = teleportLocations[Value]
            
            if targetCFrame then
                humanoidRootPart.CFrame = targetCFrame
                print("Teleported to " .. Value)
            else
                print("No CFrame found for the selected island.")
            end
        end    
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Local Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    -- Ninja Legends
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    ------------------------
    
    elseif game.PlaceId == 3956818381 then
        
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local Window = OrionLib:MakeWindow({Name = "Kak.Hub Reworked (Ninja Legends)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false, IntroText = "By Kak"})
    
    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Ninjitsu",
        Callback = function()
            while true do
    
                local args = {
                    [1] = "swingKatana"
                }
                
                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
        
                wait(0.1)
        
            end
          end    
    })
    
    Tab:AddButton({
        Name = "Unlock All Islands",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(45.8419991, 787.232178, -151.813995, -0.766061664, -0, -0.642767608, 0, -1.00000048, 0, -0.642767608, 0, 0.766061246)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(232.594055, 2044.78235, 266.41507, -0.258864403, 0, 0.965913713, 0, -1, 0, 0.965913713, 0, 0.258864343)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.842133, 4070.43237, 44.2856903, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.994003, 5686.7334, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.994003, 9314.7334, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.994003, 13709.5869, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.994003, 17715.8828, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.994003, 24099.5762, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 28292.5195, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 33243.2109, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 39353.8047, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 46046.7891, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 52643.9961, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 59630.9141, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 66705.4062, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 70307.3984, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 74479.0938, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 79783.2266, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 83235.2266, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 87087.3125, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140.093933, 91282.3125, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
        
          end
    })
    
    local teleportLocations = {
        ["Enchanted Island"] = CFrame.new(45.8419991, 787.232178, -151.813995, -0.766061664, -0, -0.642767608, 0, -1.00000048, 0, -0.642767608, 0, 0.766061246),
        ["Astral Island"] = CFrame.new(232.594055, 2044.78235, 266.41507, -0.258864403, 0, 0.965913713, 0, -1, 0, 0.965913713, 0, 0.258864343),
        ["Mystical Island"] = CFrame.new(183.842133, 4070.43237, 44.2856903, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Space Island"] = CFrame.new(141.994003, 5686.7334, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Tundra Island"] = CFrame.new(141.994003, 9314.7334, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Eternal Island"] = CFrame.new(141.994003, 13709.5869, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["SandStorm"] = CFrame.new(141.994003, 17715.8828, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["ThunderStorm"] = CFrame.new(141.994003, 24099.5762, 72.4150009, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Ancient Inferno Island"] = CFrame.new(140.093933, 28292.5195, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Midnight Shadow Island"] = CFrame.new(140.093933, 33243.2109, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Mythical Souls Island"] = CFrame.new(140.093933, 39353.8047, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Winter Wonder Island"] = CFrame.new(140.093933, 46046.7891, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Golden Master Island"] = CFrame.new(140.093933, 52643.9961, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Dragon Legend Island"] = CFrame.new(140.093933, 59630.9141, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Cybernetic Legends Island"] = CFrame.new(140.093933, 66705.4062, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Skystorm Ultaus Island"] = CFrame.new(140.093933, 70307.3984, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Chaos Legends Island"] = CFrame.new(140.093933, 74479.0938, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Soul Fusion Island"] = CFrame.new(140.093933, 79783.2266, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Dark Elements Island"] = CFrame.new(140.093933, 83235.2266, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Inner Peace Island"] = CFrame.new(140.093933, 87087.3125, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961),
        ["Blazing Vortex Island"] = CFrame.new(140.093933, 91282.3125, 66.5151367, 0.939700544, 0, -0.341998369, 0, -1.00000048, -0, -0.341998369, 0, -0.939700961)
    }

    local Tab = Window:MakeTab({
        Name = "ESP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
        
    Tab:AddLabel("Name ESP")
    
    local espObjects = {}
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Name ESP",
        Default = false,
        Callback = function(Value)
            local players = game:GetService("Players")
            local localPlayer = players.LocalPlayer
    
            local function createESPForPlayer(player)
                if player ~= localPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and not espObjects[player] then
                        local billboardGui = Instance.new("BillboardGui")
                        billboardGui.Name = "NameESP"
                        billboardGui.Adornee = head
                        billboardGui.Size = UDim2.new(0, 100, 0, 25)
                        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                        billboardGui.AlwaysOnTop = true
    
                        local nameLabel = Instance.new("TextLabel", billboardGui)
                        nameLabel.Text = player.Name
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextScaled = true
    
                        local uiStroke = Instance.new("UIStroke", nameLabel)
                        uiStroke.Thickness = 2
                        uiStroke.Color = Color3.new(0, 0, 0)
    
                        local function updateDistance()
                            local character = localPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                nameLabel.Text = player.Name .. " [" .. math.floor(distance) .. " studs]"
                            end
                        end
    
                        game:GetService("RunService").RenderStepped:Connect(updateDistance)
                        billboardGui.Parent = head
    
                        espObjects[player] = billboardGui
                    end
                end
            end
    
            local function enableESP()
                for _, player in pairs(players:GetPlayers()) do
                    createESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createESPForPlayer(player)
                end)
            end
    
            local function disableESP()
                for player, esp in pairs(espObjects) do
                    if esp then
                        esp:Destroy()
                    end
                end
                espObjects = {}
            end
    
            if Value then
                enableESP()
                print("Name ESP Enabled")
            else
                disableESP()
                print("Name ESP Disabled")
            end
        end
    })
        

    Tab:AddLabel("Box ESP")

    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local boxEspObjects = {}
    local espColor = Color3.new(0, 0, 1)
    local espEnabled = false
    local rainbowEnabled = false
    
    local function createRainbowEffect()
        while rainbowEnabled do
            local hue = tick() % 5 / 5
            espColor = Color3.fromHSV(hue, 1, 1)
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            task.wait(0.5)
        end
    end
    
    Tab:AddToggle({
        Name = "Toggle Box ESP",
        Default = false,
        Callback = function(Value)
            espEnabled = Value
    
            if espEnabled then
                local function createBoxESPForPlayer(player)
                    if player ~= localPlayer and player.Character then
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = espColor
                            boxHandleAdornment.Parent = rootPart
    
                            boxEspObjects[player] = boxHandleAdornment
                        end
                    end
                end
    
                for _, player in pairs(players:GetPlayers()) do
                    createBoxESPForPlayer(player)
                end
    
                players.PlayerAdded:Connect(function(player)
                    createBoxESPForPlayer(player)
                end)
    
                print("Enabled Character Box ESP")
            else
                for player, esp in pairs(boxEspObjects) do
                    if esp then
                        esp:Destroy()
                    end
                    boxEspObjects[player] = nil
                end
    
                print("Character Box ESP Has Been Removed")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Rainbow Box ESP",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
            if rainbowEnabled then
                createRainbowEffect()
            end
        end
    })

    Tab:AddColorpicker({
        Name = "The Color Of The Box ESP",
        Default = Color3.new(0, 0, 1),
        Callback = function(Value)
            espColor = Value
            for _, box in pairs(boxEspObjects) do
                box.Color3 = espColor
            end
            print("Box ESP color updated to:", Value)
        end
    })
    
    Tab:AddLabel("Tracer ESP")
    
    local TargetPartName = "HumanoidRootPart"
    local LineColor = Color3.fromRGB(0, 255, 0)
    local LineWidth = 0.5
    local DrawTeammates = true
    local FindHumanoids = true
    local GetLineOrigin = function(Camera)
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * .9)
    end
    
    local Camera = workspace.CurrentCamera
    local LineOrigin = nil
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        LineOrigin = GetLineOrigin(Camera)
    end)
    LineOrigin = GetLineOrigin(Camera)
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SnaplineGui"
    Gui.Parent = game.Players.LocalPlayer.PlayerGui
    local Lines = {}
    
    function Setline(Line, Width, Color, Origin, Destination)
        local Position = (Origin + Destination) / 2
        Line.Position = UDim2.new(0, Position.X, 0, Position.Y)
        local Length = (Origin - Destination).Magnitude
        Line.BackgroundColor3 = Color
        Line.BorderColor3 = Color
        Line.Size = UDim2.new(0, Length, 0, Width)
        Line.Rotation = math.deg(math.atan2(Destination.Y - Origin.Y, Destination.X - Origin.X))
    end
    
    local function ClearOldTracers()
        for _, Line in pairs(Lines) do
            Line:Destroy()
        end
        Lines = {}
    end
    
    local tracersEnabled = false
    local rainbowEnabled = false
    
    local function getRainbowColor()
        local time = tick() * 1
        return Color3.fromHSV(math.sin(time) * 0.5 + 0.5, 1, 1)
    end
    
    Tab:AddToggle({
        Name = "(For Players) Toggle Tracers ESP (it may cause lag)",
        Default = false,
        Callback = function(Value)
            tracersEnabled = Value
            if not tracersEnabled then
                ClearOldTracers()
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Rainbow Tracers",
        Default = false,
        Callback = function(Value)
            rainbowEnabled = Value
        end    
    })
    
    Tab:AddColorpicker({
        Name = "The Color Of The Tracer ESP",
        Default = Color3.fromRGB(0, 255, 0),
        Callback = function(Value)
            LineColor = Value
        end
    })
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if not tracersEnabled then return end
    
        local Targets = {}
        for i, Player in pairs(game.Players:GetPlayers()) do
            if Player == game.Players.LocalPlayer then continue end
            local Character = Player.Character
            if not Character then continue end
            local TargetPart = Character:FindFirstChild(TargetPartName)
            if not TargetPart then continue end
            local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
            if OnScreen then
                local color = rainbowEnabled and getRainbowColor() or LineColor
                table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
            end
        end
        if FindHumanoids then
            for _, Obj in pairs(workspace:GetDescendants()) do
                if Obj.ClassName ~= "Humanoid" then continue end
                if game.Players:FindFirstChild(Obj.Parent.Name) then continue end
                local TargetPart = Obj.Parent:FindFirstChild(TargetPartName)
                if not TargetPart then continue end
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(TargetPart.Position)
                if OnScreen then
                    local color = rainbowEnabled and getRainbowColor() or LineColor
                    table.insert(Targets, {Vector2.new(ScreenPoint.X, ScreenPoint.Y), color})
                end
            end
        end
    
        ClearOldTracers()
    
        for i, TargetData in pairs(Targets) do
            local NewLine = Instance.new("Frame")
            NewLine.Name = "Snapline"
            NewLine.AnchorPoint = Vector2.new(.5, .5)
            NewLine.Parent = Gui
            Setline(NewLine, LineWidth, TargetData[2], LineOrigin, TargetData[1])
            table.insert(Lines, NewLine)
        end
    end)

    local Tab = Window:MakeTab({
        Name = "TP and Target",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    Tab:AddLabel("TP Part")

    Tab:AddDropdown({
        Name = "Choose An Island To Teleport",
        Default = "",
        Options = {
            "Enchanted Island", "Astral Island", "Mystical Island", "Space Island",
            "Tundra Island", "Eternal Island", "SandStorm", "ThunderStorm",
            "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island",
            "Winter Wonder Island", "Golden Master Island", "Dragon Legend Island",
            "Cybernetic Legends Island", "Skystorm Ultaus Island", "Chaos Legends Island",
            "Soul Fusion Island", "Dark Elements Island", "Inner Peace Island",
            "Blazing Vortex Island"
        },
        Callback = function(selectedIsland)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
            local targetCFrame = teleportLocations[selectedIsland]
            if targetCFrame then
                humanoidRootPart.CFrame = targetCFrame
                print("Teleported to " .. selectedIsland)
            else
                print("No teleport location found for " .. selectedIsland)
            end
        end    
    })
    
    Tab:AddLabel("Target Part")
    
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    
    local playerNames = {}
    local selectedPlayerName = nil
    
    local function updatePlayerNames()
        playerNames = {}
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer ~= player then
                table.insert(playerNames, otherPlayer.Name)
            end
        end
    end
    
    Players.PlayerAdded:Connect(updatePlayerNames)
    Players.PlayerRemoving:Connect(updatePlayerNames)
    
    updatePlayerNames()
    
    Tab:AddDropdown({
        Name = "Select A Player",
        Default = "",
        Options = playerNames,
        Callback = function(Value)
            selectedPlayerName = Value
        end    
    })
    
    Tab:AddToggle({
        Name = "Box ESP Selected Player",
        Default = false,
        Callback = function(Value)
            local function createBoxESPForSelectedPlayer()
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local rootPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart and not espObject then
                            local boxHandleAdornment = Instance.new("BoxHandleAdornment")
                            boxHandleAdornment.Size = Vector3.new(4, 7, 4)
                            boxHandleAdornment.Adornee = rootPart
                            boxHandleAdornment.AlwaysOnTop = true
                            boxHandleAdornment.ZIndex = 10
                            boxHandleAdornment.Transparency = 0.5
                            boxHandleAdornment.Color3 = Color3.new(0, 0, 1)
                            boxHandleAdornment.Parent = rootPart
    
                            espObject = boxHandleAdornment
                        end
                    end
                else
                    warn("No player selected!")
                end
            end
    
            local function removeBoxESP()
                if espObject then
                    espObject:Destroy()
                    espObject = nil
                end
            end
    
            if Value then
                createBoxESPForSelectedPlayer()
                print("ESP Enabled for", selectedPlayerName or "No Player Selected")
            else
                removeBoxESP()
                print("ESP Disabled")
            end
        end
    })
    
    Tab:AddToggle({
        Name = "Follow The Selected Player",
        Default = false,
        Callback = function(Value)
            teleportLoopActive = Value
            if teleportLoopActive then
                if not selectedPlayerName then
                    print("Please select a player from the dropdown menu before toggling!")
                    teleportLoopActive = false
                    return
                end
    
                while teleportLoopActive do
                    task.wait(0.1)
                    if selectedPlayerName then
                        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "Spectate Selected Player",
        Default = false,
        Callback = function(Value)
            if Value then
                if selectedPlayerName then
                    local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                    if selectedPlayer and selectedPlayer.Character then
                        local head = selectedPlayer.Character:FindFirstChild("Head")
                        if head then
                            camera.CameraSubject = head
                        else
                            warn("Selected player's head not found!")
                        end
                    else
                        game:GetService("StarterGui"):SetCore("SendNotification",{
                            Title = "Error!",
                            Text = "Error while finding the selected player.",
                        })
                    end
                else
                    warn("Select a player to spectate")
                end
            else
                camera.CameraSubject = player.Character or player
            end
        end    
    })
    
    Tab:AddButton({
        Name = "Teleport To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPosition and playerHumanoidRootPart then
                        playerHumanoidRootPart.CFrame = targetPosition.CFrame
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to teleport")
            end
        end    
    })
    
    Tab:AddToggle({
        Name = "ESP Selected Player",
        Default = false,
        Callback = function(Value)
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local character = selectedPlayer.Character
                    local head = character:FindFirstChild("Head")
                    local billboardGui = character:FindFirstChild("BillboardGui")
    
                    if Value then
                        if not billboardGui then
                            billboardGui = Instance.new("BillboardGui")
                            billboardGui.Parent = character
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                            billboardGui.AlwaysOnTop = true
    
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            textLabel.TextStrokeTransparency = 0.5
                            textLabel.TextSize = 14
    
                            local function updateESP()
                                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                textLabel.Text = selectedPlayer.Name .. "\nDistance: " .. math.round(distance) .. " studs"
                            end
    
                            game:GetService("RunService").Heartbeat:Connect(function()
                                updateESP()
                            end)
                        end
                    else
                        if billboardGui then
                            billboardGui:Destroy()
                        end
                    end
                else
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Error!",
                        Text = "Error while finding the selected player.",
                    })
                end
            else
                warn("Select a player to add ESP")
            end
        end    
    })
    
    local TweenService = game:GetService("TweenService")
    
    Tab:AddButton({
        Name = "Tween To Selected Player",
        Callback = function()
            if selectedPlayerName then
                local selectedPlayer = Players:FindFirstChild(selectedPlayerName)
                if selectedPlayer and selectedPlayer.Character then
                    local targetPosition = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local playerHumanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetPosition and playerHumanoidRootPart then
                        local targetCFrame = targetPosition.CFrame
    
                        local tweenInfo = TweenInfo.new(
                            1,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.Out,
                            0,
                            false,
                            0
                        )
    
                        local tweenGoal = {CFrame = targetCFrame}
    
                        local tween = TweenService:Create(playerHumanoidRootPart, tweenInfo, tweenGoal)
    
                        tween:Play()
    
                        tween.Completed:Connect(function()
                            print("Tween Completed!")
                        end)
    
                    else
                        warn("Target player or their HumanoidRootPart not found!")
                    end
                else
                    warn("Selected player or their character not found!")
                end
            else
                warn("Select a player to tween to")
            end
        end    
    })
    
    Tab:AddLabel("Randoms")
    
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    
    Tab:AddButton({
        Name = "Teleport to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to teleport to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    Tab:AddButton({
        Name = "Tween to Random Player",
        Callback = function()
            local allPlayers = Players:GetPlayers()
            
            local otherPlayers = {}
            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    table.insert(otherPlayers, player)
                end
            end
            
            if #otherPlayers == 0 then
                warn("No other players to tween to!")
                return
            end
            
            local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
            
            if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = randomPlayer.Character.HumanoidRootPart.Position
                local character = localPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    
                    local tweenInfo = TweenInfo.new(
                        2,
                        Enum.EasingStyle.Quad,
                        Enum.EasingDirection.Out
                    )
                    local goal = {
                        CFrame = CFrame.new(targetPosition)
                    }
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
                    tween:Play()
                    
                    print("Tweening to:", randomPlayer.Name)
                else
                    warn("Your character is missing a HumanoidRootPart!")
                end
            else
                warn("Target player does not have a valid character!")
            end
        end
    })
    
    local Tab = Window:MakeTab({
        Name = "Local Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Player Name: " .. game.Players.LocalPlayer.Name)
    
    Tab:AddTextbox({
        Name = "WalkSpeed Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end	  
    })
    
    Tab:AddTextbox({
        Name = "JumpPower Textbox",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end	  
    })
    
    local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Load Toggle Orion GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/kilc8hhw/raw"))()
          end    
    })
    
    Tab:AddButton({
        Name = "Our Discord Server",
        Callback = function()
              setclipboard("https://discord.gg/tW4gHCbzxh")
    
              game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Copyied Link!",
                Text = "Copied Link For Our Discord Server.",
            })
          end    
    })
    
    Tab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
          end    
    })
    
    else
        LocalPlayer:Kick("Sorry! This game is NOT supported by Kak.Hub.")
    end

end

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ================ THE KEY SYSTEM ==============================
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function LoadKakHubKeySystem()

    local correctKey = "ED41298A485F18BD2D1A89D989C3A"

    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    local NewKeySystemGUI = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local InputBox = Instance.new("TextBox")
    local UICorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local SubmitKeyButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local GetKeyButton = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local JoinDiscordButton = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
	local EnglishButton = Instance.new("TextButton")
    local UICorner_5 = Instance.new("UICorner")
	local SpanishButton = Instance.new("TextButton")
    local UICorner_6 = Instance.new("UICorner")
	local TurkishButton = Instance.new("TextButton")
    local UICorner_7 = Instance.new("UICorner")
    local CoreGui = game:GetService("CoreGui")

    NewKeySystemGUI.Name = "KeySystemGuiV2"
    NewKeySystemGUI.Parent = CoreGui
    NewKeySystemGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Background
    Background.Name = "Background"
    Background.Parent = NewKeySystemGUI
    Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Background.BackgroundTransparency = 0.1
    Background.Size = UDim2.new(0.6, 0, 0.7, 0)
    Background.Position = UDim2.new(0.2, 0, 0.15, 0)
    
    local backgroundUICorner = Instance.new("UICorner")
    backgroundUICorner.Parent = Background
    
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    local isDraggable = true
    local tweenService = game:GetService("TweenService")
    
    Background.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and isDraggable then
            isDragging = true
            dragStart = input.Position
            startPos = Background.Position
        end
    end)
    
    Background.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            local targetPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = tweenService:Create(Background, tweenInfo, {Position = targetPos})
            tween:Play()
        end
    end)
    
    Background.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    
    -- Title Label
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = Background
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 0.15, 0)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "Welcome to Key System"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextScaled = true
    
    -- Input Box
    InputBox.Name = "InputBox"
    InputBox.Parent = Background
    InputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    InputBox.Size = UDim2.new(0.8, 0, 0.12, 0)
    InputBox.Position = UDim2.new(0.1, 0, 0.25, 0)
    InputBox.Font = Enum.Font.Gotham
    InputBox.PlaceholderText = "Enter your key here..."
    InputBox.Text = ""
    InputBox.TextColor3 = Color3.fromRGB(200, 200, 200)
    InputBox.TextScaled = true
    UICorner.Parent = InputBox
    
    -- Submit Key Button
    SubmitKeyButton.Name = "SubmitKeyButton"
    SubmitKeyButton.Parent = Background
    SubmitKeyButton.BackgroundColor3 = Color3.fromRGB(45, 180, 60)
    SubmitKeyButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    SubmitKeyButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    SubmitKeyButton.Font = Enum.Font.GothamBold
    SubmitKeyButton.Text = "Submit Key"
    SubmitKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitKeyButton.TextScaled = true
    UICorner_2.Parent = SubmitKeyButton

	SubmitKeyButton.MouseButton1Click:Connect(function()
        if InputBox.Text == correctKey then
            OrionLib:MakeNotification({
                Name = "Key Accepted!",
                Content = "Welcome to the Hub.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            NewKeySystemGUI:Destroy()
            LoadREALKakHubReworked()
        else
            OrionLib:MakeNotification({
                Name = "Invalid Key!",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end)
    
    -- Get Key Button
    GetKeyButton.Name = "GetKeyButton"
    GetKeyButton.Parent = Background
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    GetKeyButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    GetKeyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    GetKeyButton.Font = Enum.Font.GothamBold
    GetKeyButton.Text = "Get Key"
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyButton.TextScaled = true
    UICorner_3.Parent = GetKeyButton

	GetKeyButton.MouseButton1Click:Connect(function()
        setclipboard("https://lootdest.org/s?d671dcfd")
        showNotification2()
    end)
    
    -- Join Discord Button
    JoinDiscordButton.Name = "JoinDiscordButton"
    JoinDiscordButton.Parent = Background
    JoinDiscordButton.BackgroundColor3 = Color3.fromRGB(70, 70, 200)
    JoinDiscordButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    JoinDiscordButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    JoinDiscordButton.Font = Enum.Font.GothamBold
    JoinDiscordButton.Text = "Join Discord"
    JoinDiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    JoinDiscordButton.TextScaled = true
    UICorner_4.Parent = JoinDiscordButton

	JoinDiscordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/tW4gHCbzxh")
		showNotification()
    end)

	local CurrentLanguage = ""
	local CurrentLanguage2 = ""
	local CurrentLanguage3 = ""

	-- 1 Notification Function
	function showNotification()
		if CurrentLanguage == "Spanish" then
			OrionLib:MakeNotification({
				Name = "¡Enlace de Discord Copiado!",
				Content = "El enlace de invitación ha sido copiado a tu portapapeles.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		elseif CurrentLanguage == "Turkish" then
			OrionLib:MakeNotification({
				Name = "Discord Linki Kopyalandı!",
				Content = "Davet linki panonuza kopyalandı.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			OrionLib:MakeNotification({
				Name = "Discord Link Copied!",
				Content = "The invite link has been copied to your clipboard.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end

	-- 2 Notification Function
	function showNotification2()
		if CurrentLanguage2 == "Spanish" then
			OrionLib:MakeNotification({
				Name = "¡Enlace de clave copiado!",
				Content = "El enlace de la clave ha sido copiado a tu portapapeles.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})			
		elseif CurrentLanguage2 == "Turkish" then
			OrionLib:MakeNotification({
				Name = "Anahtar Linki Kopyalandı!",
				Content = "Anahtar linki panonuza kopyalandı.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})			
		else
			OrionLib:MakeNotification({
				Name = "Key Link Copied!",
				Content = "The key link has been copied to your clipboard.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end

	-- 3 Notification Function
	function showNotification3()
		if CurrentLanguage3 == "Spanish" then
			OrionLib:MakeNotification({
				Name = "¡Enlace de clave copiado!",
				Content = "El enlace de la clave ha sido copiado a tu portapapeles.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})            
		elseif CurrentLanguage3 == "Turkish" then
			OrionLib:MakeNotification({
				Name = "Anahtar Linki Kopyalandı!",
				Content = "Anahtar linki panonuza kopyalandı.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})            
		else
			OrionLib:MakeNotification({
				Name = "Key Link Copied!",
				Content = "The key link has been copied to your clipboard.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end

    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Background
    CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    CloseButton.Position = UDim2.new(0.85, 0, 0.85, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextScaled = true
    local closeButtonCorner = Instance.new("UICorner")
    closeButtonCorner.Parent = CloseButton

    CloseButton.MouseButton1Click:Connect(function()
        local NewKeySystemGUI = CoreGui:FindFirstChild("KeySystemGuiV2")
            if NewKeySystemGUI then
                NewKeySystemGUI:Destroy()
            end
    end)

    -- Draggable Button
    local DraggableButton = Instance.new("TextButton")
    DraggableButton.Name = "DraggableButton"
    DraggableButton.Parent = Background
    DraggableButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DraggableButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    DraggableButton.Position = UDim2.new(0.73, 0, 0.85, 0)
    DraggableButton.Font = Enum.Font.GothamBold
    DraggableButton.Text = "🔓"
    DraggableButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DraggableButton.TextScaled = true
    local langButtonCorner = Instance.new("UICorner")
    langButtonCorner.Parent = DraggableButton

    DraggableButton.MouseButton1Click:Connect(function()
        if DraggableButton.Text == "🔓" then
            DraggableButton.Text = "🔒"
            isDraggable = false
        else
            DraggableButton.Text = "🔓"
            isDraggable = true
        end
    end)

    -- Language Button
    local LanguageButton = Instance.new("TextButton")
    LanguageButton.Name = "LanguageButton"
    LanguageButton.Parent = Background
    LanguageButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    LanguageButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    LanguageButton.Position = UDim2.new(0.61, 0, 0.85, 0)
    LanguageButton.Font = Enum.Font.GothamBold
    LanguageButton.Text = "🌐"
    LanguageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LanguageButton.TextScaled = true
    local langButtonCorner = Instance.new("UICorner")
    langButtonCorner.Parent = LanguageButton

    LanguageButton.MouseButton1Click:Connect(function()

        if LanguageButton.Position == UDim2.new(0.61, 0, 0.85, 0) then
            LanguageButton.Position = UDim2.new(0.73, 0, 0.85, 0)
        else
            LanguageButton.Position = UDim2.new(0.61, 0, 0.85, 0)
        end

        InputBox.Visible = not InputBox.Visible
        SubmitKeyButton.Visible = not SubmitKeyButton.Visible
        GetKeyButton.Visible = not GetKeyButton.Visible
        JoinDiscordButton.Visible = not JoinDiscordButton.Visible
        EnglishButton.Visible = not EnglishButton.Visible
        SpanishButton.Visible = not SpanishButton.Visible
        TurkishButton.Visible = not TurkishButton.Visible
        DraggableButton.Visible = not DraggableButton.Visible

        if TitleLabel.Text == "Welcome to Key System" then
            TitleLabel.Text = "Select Language"
        else
            TitleLabel.Text = "Welcome to Key System"
        end

        if LanguageButton.Text == "🌐" then
            LanguageButton.Text = "⬅"
        else
            LanguageButton.Text = "🌐"
        end
    end)

	-- English Button
    EnglishButton.Name = "EnglishButton"
    EnglishButton.Parent = Background
    EnglishButton.BackgroundColor3 = Color3.fromRGB(45, 180, 60)
    EnglishButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    EnglishButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    EnglishButton.Font = Enum.Font.GothamBold
    EnglishButton.Text = "English"
    EnglishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    EnglishButton.TextScaled = true
	EnglishButton.Visible = false
    UICorner_5.Parent = EnglishButton
	
	EnglishButton.MouseButton1Click:Connect(function()
		CurrentLanguage = "English"
		CurrentLanguage2 = "English"
		CurrentLanguage3 = "English"

		InputBox.Visible = not InputBox.Visible
		SubmitKeyButton.Visible = not SubmitKeyButton.Visible
		GetKeyButton.Visible = not GetKeyButton.Visible
		JoinDiscordButton.Visible = not JoinDiscordButton.Visible
		EnglishButton.Visible = not EnglishButton.Visible
		SpanishButton.Visible = not SpanishButton.Visible
		TurkishButton.Visible = not TurkishButton.Visible

		if TitleLabel.Text == "Select Language" then
			TitleLabel.Text = "Welcome to Key System"
		else
			TitleLabel.Text = "Select Language"
		end
	end)

	-- Spanish Button
    SpanishButton.Name = "SpanishButton"
    SpanishButton.Parent = Background
    SpanishButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    SpanishButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    SpanishButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    SpanishButton.Font = Enum.Font.GothamBold
    SpanishButton.Text = "Español"
    SpanishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpanishButton.TextScaled = true
	SpanishButton.Visible = false
    UICorner_6.Parent = SpanishButton

	SpanishButton.MouseButton1Click:Connect(function()
		CurrentLanguage = "Spanish"
		CurrentLanguage2 = "Spanish"
		CurrentLanguage3 = "Spanish"

		InputBox.Visible = not InputBox.Visible
		SubmitKeyButton.Visible = not SubmitKeyButton.Visible
		GetKeyButton.Visible = not GetKeyButton.Visible
		JoinDiscordButton.Visible = not JoinDiscordButton.Visible
		EnglishButton.Visible = not EnglishButton.Visible
		SpanishButton.Visible = not SpanishButton.Visible
		TurkishButton.Visible = not TurkishButton.Visible

		if TitleLabel.Text == "Select Language" then
			TitleLabel.Text = "Bienvenido al sistema clave"
		else
			TitleLabel.Text = "Select Language"
		end

		if InputBox.PlaceholderText == "Enter your key here..." then
			InputBox.PlaceholderText = "Introduzca su clave aquí..."
		else
			InputBox.PlaceholderText = "Select Language"
		end

		if SubmitKeyButton.Text == "Submit Key" then
			SubmitKeyButton.Text = "Enviar clave"
		else
			SubmitKeyButton.Text = "Submit Key"
		end

		if GetKeyButton.Text == "Get Key" then
			GetKeyButton.Text = "Obtener clave"
		else
			GetKeyButton.Text = "Get Key"
		end

		if JoinDiscordButton.Text == "Join Discord" then
			JoinDiscordButton.Text = "Unirse Discord"
		else
			JoinDiscordButton.Text = "Join Discord"
		end
	end)

	-- Turkish Button
    TurkishButton.Name = "TurkishButton"
    TurkishButton.Parent = Background
    TurkishButton.BackgroundColor3 = Color3.fromRGB(70, 70, 200)
    TurkishButton.Size = UDim2.new(0.8, 0, 0.12, 0)
    TurkishButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    TurkishButton.Font = Enum.Font.GothamBold
    TurkishButton.Text = "Türkçe"
    TurkishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TurkishButton.TextScaled = true
	TurkishButton.Visible = false
    UICorner_7.Parent = TurkishButton

	TurkishButton.MouseButton1Click:Connect(function()
		CurrentLanguage = "Turkish"
		CurrentLanguage2 = "Turkish"
		CurrentLanguage3 = "Turkish"
		
		InputBox.Visible = not InputBox.Visible
		SubmitKeyButton.Visible = not SubmitKeyButton.Visible
		GetKeyButton.Visible = not GetKeyButton.Visible
		JoinDiscordButton.Visible = not JoinDiscordButton.Visible
		EnglishButton.Visible = not EnglishButton.Visible
		SpanishButton.Visible = not SpanishButton.Visible
		TurkishButton.Visible = not TurkishButton.Visible

		if TitleLabel.Text == "Select Language" then
			TitleLabel.Text = "Dil Seç"
		else
			TitleLabel.Text = "Select Language"
		end

		if InputBox.PlaceholderText == "Enter your key here..." then
			InputBox.PlaceholderText = "Anahtarınızı buraya girin..."
		else
			InputBox.PlaceholderText = "Select Language"
		end

		if SubmitKeyButton.Text == "Submit Key" then
			SubmitKeyButton.Text = "Anahtarı Doğrula"
		else
			SubmitKeyButton.Text = "Submit Key"
		end

		if GetKeyButton.Text == "Get Key" then
			GetKeyButton.Text = "Anahtar Al"
		else
			GetKeyButton.Text = "Get Key"
		end

		if JoinDiscordButton.Text == "Join Discord" then
			JoinDiscordButton.Text = "Discord'a Katıl"
		else
			JoinDiscordButton.Text = "Join Discord"
		end
	end)

end

local CoreGui = game:GetService("CoreGui")
local guiName = "KeySystemGuiV2"

if CoreGui:FindFirstChild(guiName) then
    CoreGui[guiName]:Destroy()
    print("GUI silindi: " .. guiName)
	LoadKakHubKeySystem()
else
    print("GUI bulunamadı, Key System yükleniyor...")
    LoadKakHubKeySystem()
end
