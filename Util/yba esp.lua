repeat wait() until game:IsLoaded()

local function esp(char)
	pcall(function()
		local plr = game:GetService("Players"):GetPlayerFromCharacter(char)
		if not plr then return end

		local health = char:FindFirstChild("Health")
		if not health then return end
		if not health:IsA("DoubleConstrainedValue") then return end
		local uppertorso = char:FindFirstChild("UpperTorso")
		if not uppertorso then return end

		if uppertorso:FindFirstChild("HP_DISPLAY_GUI") then
			uppertorso["HP_DISPLAY_GUI"]:Destroy()
		end
		if uppertorso:FindFirstChild("INFO_DISPLAY_GUI") then
			uppertorso["INFO_DISPLAY_GUI"]:Destroy()
		end

		if _G.qESP_ENABLED == false then return end

		local bbgui = Instance.new("BillboardGui",uppertorso)
		bbgui.Name = "HP_DISPLAY_GUI"
		bbgui.AlwaysOnTop = true
		bbgui.ExtentsOffset = Vector3.new(0,5,0)
		bbgui.Size = UDim2.new(5,0,1.2,0)
		bbgui.MaxDistance = _G.MAXDISTANCE
		bbgui.ResetOnSpawn = false

		local bgframe = Instance.new("Frame",bbgui)
		bgframe.BorderSizePixel = 0
		bgframe.BackgroundColor3 = Color3.fromRGB(80,80,80)
		bgframe.Size = UDim2.new(.9,0,.45,0)
		bgframe.Position = UDim2.new(.05,0,.5,0)

		local barframe = Instance.new("Frame",bgframe)
		barframe.BorderSizePixel = 0
        if plr.PlayerStats.Race.Value ~= "Vampire" then
            barframe.BackgroundColor3 = Color3.fromRGB(100,255,100)
        else
            barframe.BackgroundColor3 = Color3.fromRGB(255,100,100)
        end
		barframe.ZIndex = 2
		barframe.Size = UDim2.new(health.Value / health.MaxValue, 0, 1, 0)

		local text = Instance.new("TextLabel",bgframe)
		text.Font = _G.HEALTHBARTEXTFONT
		text.BackgroundTransparency = 1
		text.TextScaled = true
		text.Size = UDim2.new(1,0,1,0)
		text.ZIndex = 3
		text.Text = math.floor(health.Value).." / "..math.floor(health.MaxValue)

		local infobbgui = Instance.new("BillboardGui",uppertorso)
		infobbgui.Name = "INFO_DISPLAY_GUI"
		infobbgui.AlwaysOnTop = true
		infobbgui.ExtentsOffset = Vector3.new(0,6,0)
		infobbgui.Size = UDim2.new(0,150,0,75)
		infobbgui.ResetOnSpawn = false
		infobbgui.MaxDistance = _G.MAXDISTANCE

		local name = Instance.new("TextLabel",infobbgui)
		name.Font = _G.USERNAMEFONT
		if game:GetService("Players").LocalPlayer:IsFriendsWith(plr.UserId) then
			name.TextColor3 = Color3.fromRGB(0,0,255)
		else
			name.TextColor3 = Color3.fromRGB(255,255,255)
		end
		name.TextScaled = false
		name.TextSize = _G.USERNAMETEXTSIZE
		name.TextStrokeTransparency = 0
		if char:FindFirstChild("StandMorph") then
			if char.StandMorph:FindFirstChild("UpperTorso") then
				if char.StandMorph.UpperTorso:IsA("BasePart") then
					name.TextStrokeColor3 = char.StandMorph.UpperTorso.Color
				else
					name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
				end
			else
				name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
			end
		else
			name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
		end
		name.Size = UDim2.new(.75,0,.25,0)
		name.Position = UDim2.new(.125,0,.25,0)
		name.ZIndex = 3
		name.BackgroundTransparency = 1

		local spec = "Specless"
		local stand = "Standless"
		if plr.PlayerStats.Spec.Value ~= "None" then
			spec = plr.PlayerStats.Spec.Value
		end
		if plr.PlayerStats.Stand.Value ~= "None" then
			stand = plr.PlayerStats.Stand.Value
		end

		name.Text = plr.Name.."\n"..stand.." | "..spec

		health.Changed:Connect(function()
			if not health then return end
			barframe.Size = UDim2.new(health.Value / health.MaxValue, 0, 1, 0)

			if _G.SHOWHEALTHDECIMALS then
				text.Text = health.Value.." / "..health.MaxValue
			else
				text.Text = math.floor(health.Value).." / "..math.floor(health.MaxValue)
			end
		end)
	end)
end

while wait(_G.REFRESHTIME) do
	for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
	    esp(plr.Character)
	end
end