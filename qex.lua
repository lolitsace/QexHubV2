local starttime = os.clock()

getgenv().check_exploit = (syn and "Synapse") or (KRNL_LOADED and "Krnl") or (isourclosure and "ScriptWare") or nil
if not qexkey then
	if isfile("QexHub/defaultkey.txt") then
		getgenv().qexkey = tostring(readfile("QexHub/defaultkey.txt"))
	end
end

--------------------------------------------------
--------------------------------------------------

loadstring(game:HttpGet"https://pastebin.pl/view/raw/1f58ff44")()

if HerobrineEnabled then
	wait(1.25)

	local sfx = Instance.new("Sound",workspace)
	sfx.SoundId = "rbxassetid://9088081730"
	sfx.PlayOnRemove = true
	sfx.Volume = 10
	sfx:Destroy()

	wait()

	local gui = Instance.new("ScreenGui")
	syn.protect_gui(gui)
	gui.Parent = game:GetService("CoreGui")
	gui.IgnoreGuiInset = true
	gui.ZIndexBehavior = "Global"
	game:GetService("Debris"):AddItem(gui,2.5)

	local img = Instance.new("ImageLabel",gui)
	img.Size = UDim2.new(1,0,1,0)
	img.Image = "http://www.roblox.com/asset/?id=104224415"
	img.ZIndex = 999999
	img.BackgroundTransparency = 1

	wait(.3)

	game:GetService("TweenService"):Create(img,TweenInfo.new(1,Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()

	wait(1)
end

task.wait(math.random(15,40)/100)

--[[
local webhook = "link removed 😂"
local data = {
["content"] = "",
	["embeds"] = {{
		["title"] = "__***Qex Hub***__",
		["description"] = "Execution Log",
		["type"] = "rich",
		["color"] = tonumber(0x6702f5),
		["fields"] = {
			{
				["name"] = "Username",
				["value"] = "||`"..game.Players.LocalPlayer.Name.."`||",
				["inline"] = true
			},
			
			{
				["name"] = "Game",
				["value"] = "`"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."`",
				["inline"] = true
			},

			{
				["name"] = "Game ID",
				["value"] = "`"..tostring(game.PlaceId).."`",
				["inline"] = true
			},

			{
				["name"] = "Job ID",
				["value"] = "||`"..tostring(game.JobId).."`||",
				["inline"] = true
			},
			
			{
				["name"] = "Time",
				["value"] = "||`"..os.date("%I:%M:%S, %a %b %d").."`||",
				["inline"] = true
			},

			{
				["name"] = "Executor Used",
				["value"] = "`"..check_exploit.."`",
				["inline"] = true
			},
				
			{
				["name"] = "Key Used",
				["value"] = "||`"..tostring(qexkey).."`||",
				["inline"] = true
			}
		}
	}} 
}
if check_exploit == "Synapse" then
	local response = syn.request(
		{
			Url = webhook,
			Method = "POST",
			Headers = {
				['Content-Type'] = 'application/json'
			},
			Body = game:GetService("HttpService"):JSONEncode(data)
		}
	)
elseif check_exploit == "ScriptWare" then
	local response = http.request(
		{
			Url = webhook,
			Method = "POST",
			Headers = {
				['Content-Type'] = 'application/json'
			},
			Body = game:GetService("HttpService"):JSONEncode(data)
		}
	)
elseif check_exploit == "Krnl" then
	local response = request(
		{
			Url = webhook,
			Method = "POST",
			Headers = {
				['Content-Type'] = 'application/json'
			},
			Body = game:GetService("HttpService"):JSONEncode(data)
		}
	)
end
]]
task.wait(math.random(15,40)/100)

if game.PlaceId == 4111023553 then -- deepwoken
	game:GetService("Players").LocalPlayer:Kick("Qex Hub is very detectable in this game")
return end

if game.PlaceId == 4855457388 then -- demonfall main menu
    local warning = Instance.new("Message",game:GetService("CoreGui"))
	warning.Text = 'Qex Hub will not run in the main menu'
	game:GetService("Debris"):AddItem(warning,2.5)
return end

_G.QEXDEBUG = _G.QEXDEBUG or false

if QEXLOADED and not _G.QEXDEBUG then
	local warning = Instance.new("Message",game:GetService("CoreGui"))
	warning.Text = 'Qex Hub is already loaded!'
	game:GetService("Debris"):AddItem(warning,2.5)
return end

pcall(function()
	getgenv().QEXLOADED = true
end)

--
_G.SYNCHECK = _G.SYNCHECK or true

if not game:IsLoaded() then
	local warning = Instance.new("Message", game:GetService("CoreGui"))
	warning.Text = "Qex Hub is waiting for the game to fully load before executing..."
	game.Loaded:Wait()
	warning:Destroy()
end

if _G.SYNCHECK and not syn then
	local warning = Instance.new("Message",game:GetService("CoreGui"))
	warning.Text = 'Qex Hub is designed specifically for Synapse X!\nSome other executors may work, but Synapse is highly recommended.\nYou have been warned.'
	game:GetService("Debris"):AddItem(warning,4)
	task.wait(4.1)
	
	local warning2 = Instance.new("Message",game:GetService("CoreGui"))
	warning2.Text = check_exploit..' detected'
	game:GetService("Debris"):AddItem(warning2,2)
end

local plr = game:GetService("Players").LocalPlayer

local gamename = "Universal"
if game.PlaceId == 2809202155 or game.PlaceId == 6561058688 then
	gamename = "Your Bizarre Adventure"
elseif game:GetService("Lighting"):FindFirstChild("TS") and game:GetService("Lighting"):FindFirstChild("Timestop") then
	gamename = "ABD"
elseif game.PlaceId == 6751580221 then
	gamename = "Verdant Moon"
elseif game.PlaceId == 5094651510 then
	gamename = "Demonfall"
end
local library = loadstring(game:HttpGet"https://pastebin.pl/view/raw/fae57641")()
local window = library:CreateWindow("Qex Hub V2 / Qexware Technologies / "..gamename, Vector2.new(550, 650), Enum.KeyCode.RightControl)

-- funcs
function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

function roundNumber(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

COREGUI = game:GetService("CoreGui")
PARENT = nil
if (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	syn.protect_gui(Main)
	Main.Parent = COREGUI
	PARENT = Main
elseif get_hidden_gui or gethui then
	local hiddenUI = get_hidden_gui or gethui
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = hiddenUI()
	PARENT = Main
elseif COREGUI:FindFirstChild('RobloxGui') then
	PARENT = COREGUI.RobloxGui
else
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = COREGUI
	PARENT = Main
end
--

-------------------------------------------------------
-- games
if game.PlaceId == 2809202155 or game.PlaceId == 6561058688 then -- YBA
	--[[Anti cheat bypass
	local oldNamecall;
	oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {...};
		if not checkcaller() and getnamecallmethod() == "InvokeServer" and tostring(self) == "Returner" and args[1] == "idklolbrah2de" then
			if key then return key;
			else return "  ___XP DE KEY"; end
		end
		if not checkcaller() and getnamecallmethod() == "InvokeServer" and args[1] == "Reset" then
			return;
		end
		if not checkcaller() and getnamecallmethod() == "FireServer" and args[1] == "Reset" then
			return;
		end
		if not checkcaller() and getnamecallmethod() == "Kick" then
			return;
		end
		return oldNamecall(self, ...);
	end);
	--]]

	-- load kamui dimension lol
	delay(0,function()
		loadstring(game:HttpGet(("https://pastebin.pl/view/raw/9db9ebc8"),true))()

		local kamuilocation = workspace.Locations["Heaven Arena"]:Clone()
		kamuilocation.Name = "Kamui Dimension"
		kamuilocation.Color = Color3.fromRGB(0,0,0)
		kamuilocation.Lighting.FogEnd.Value = 700
		kamuilocation.Lighting.ExposureCompensation.Value = 0
		kamuilocation.Lighting.FogStart.Value = 125
		kamuilocation.Lighting.FogColor.Value = Color3.fromRGB(0,0,0)
		kamuilocation.Lighting.OutdoorAmbient.Value = Color3.fromRGB(0,0,0)
		kamuilocation.Lighting.Brightness.Value = 0
		kamuilocation.Lighting.Ambient.Value = Color3.fromRGB(220,220,220)

		kamuilocation.LocationGui.Frame.Location.TextColor3 = Color3.fromRGB(255,255,255)
		kamuilocation.LocationGui.Frame.Location.Text = "Kamui Dimension"
		kamuilocation.LocationGui.Frame.Description.Text = '"Just what is this place?"'

		kamuilocation.Position = Vector3.new(-2721.17, 11000.4, 219861)
		kamuilocation.Size = Vector3.new(2048,400,2048)
		kamuilocation.Parent = workspace.Locations
	end)
	--
	wait()
	-- abd map
	delay(0,function()
		loadstring(game:HttpGet(("https://pastebin.pl/view/raw/ac387fe3"),true))()
		
		local abdlocation = workspace.Locations["Heaven Arena"]:Clone()
		abdlocation.Name = "A Bizarre Day"
		abdlocation.Color = Color3.fromRGB(0, 0, 0)
		abdlocation.Lighting.FogEnd.Value = 9999999
		abdlocation.Lighting.ExposureCompensation.Value = 0
		abdlocation.Lighting.FogStart.Value = 999999
		abdlocation.Lighting.FogColor.Value = Color3.fromRGB(255, 255, 255)
		abdlocation.Lighting.OutdoorAmbient.Value = Color3.fromRGB(255, 255, 255)
		abdlocation.Lighting.Brightness.Value = 0.025
		abdlocation.Lighting.Ambient.Value = Color3.fromRGB(220,220,220)

		abdlocation.LocationGui.Frame.Location.TextColor3 = Color3.fromRGB(255,255,255)
		abdlocation.LocationGui.Frame.Location.Text = "A Bizarre Day"
		abdlocation.LocationGui.Frame.Description.Text = "\"A Bizarre Day (ABD) is an action/adventure game inspired by\nmany different popular shows, games, and animes.\nMost notably the Shōnen Jump Anthology's 'JoJo's Bizarre Adventure'.\""

		abdlocation.Position = Vector3.new(-25.829, 9049.362, -8657.92)
		abdlocation.Size = Vector3.new(2048,400,2048)
		abdlocation.Parent = workspace.Locations
	end)
	--

    -- playerlist spectate
    --[[
    function spectatePlayer(player)
        if isSpectating then
            if plr.Character then
                workspace.CurrentCamera.CameraSubject = plr.Character
            end
        return end

        if player.Character then
            workspace.CurrentCamera.CameraSubject = player.Character
        end
    end

    while wait(10) do
        for _,v in pairs(plr.PlayerGui.HUD.Playerlist:GetChildren()) do
            if v.Name ~= "Indicators" and game:GetService("Players"):FindFirstChild(v.Name) then
                v.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        spectatePlayer(game:GetService("Players"):FindFirstChild(v.Name))
                    end
                end)
            end
        end
    end
    ]]
    --

	local yba = window:CreateTab("YBA")
	--local yba2 = window:CreateTab("YBA 2")

	local main = yba:CreateSector("Main","left")

	main:AddButton("Use Arrow",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality I",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality II",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality III",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness I",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness II",
					["SkillTreeType"] = "Character"
				}
			}
			plr.Character.RemoteFunction:InvokeServer(unpack(args))
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Mysterious Arrow",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue2"
				}
			}

			plr.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Use Ribcage",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality I",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality II",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Vitality III",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness I",
					["SkillTreeType"] = "Character"
				}
			}

			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness II",
					["SkillTreeType"] = "Character"
				}
			}
			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness III",
					["SkillTreeType"] = "Character"
				}
			}
			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness IV",
					["SkillTreeType"] = "Character"
				}
			}
			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "LearnSkill",
				[2] = {
					["Skill"] = "Worthiness V",
					["SkillTreeType"] = "Character"
				}
			}
			plr.Character.RemoteFunction:InvokeServer(unpack(args))

			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Rib Cage of The Saint's Corpse",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue2"
				}
			}

			plr.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Use Rokakaka",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Rokakaka",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue2"
				}
			}
			plr.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Sell Item",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Merchant",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue5"
				}
			}
			plr.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Buy Pizza ($50)",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Pizza",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue2"
				}
			}
			
			game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Buy Tea ($50)",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Cafe",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue2"
				}
			}
			
			game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)

	main:AddButton("Buy Blood ($50)",function()
		if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
			local args = {
				[1] = "EndDialogue",
				[2] = {
					["NPC"] = "Alex",
					["Option"] = "Option1",
					["Dialogue"] = "Dialogue4"
				}
			}
			
			game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
		end
	end)
	
	main:AddToggle("TS Resistance (Client side)",false,function(value)
		_G.QexYbaTsResist = value
	end)

	local antivampburn = false
	main:AddToggle("Anti Vamp Burn",false,function(value)
		antivampburn = value
	end)

	delay(0,function()
		local ONC
		ONC = hookmetamethod(game, "__namecall", function(Self, ...)
		local method = getnamecallmethod()
		local args = { ... }
		if method == "FireServer" and args[1] == "VampireBurn" and antivampburn then return end
		return ONC(Self, ...)
		end)
	end)
	
	main:AddToggle("Remove Weather Fog",false,function(value)
		_G.QexYbaRemoveWeatherFog = value
	end)
	
	main:AddDropdown("Set Weather",{"Sunny","Rainy","Snowy"},"Sunny",function(value)
		workspace.Weather.Value = value
	end)

	--[[
    local AntiVampBurn = false
    main:AddToggle("Anti Vampire Burn",false,function(value)
		AntiVampBurn = value
	end)
	]]

	AntiRealityMarble = false
	main:AddToggle("Anti Reality Marble",false,function(value)
		AntiRealityMarble = value
	end)



	local movement = yba:CreateSector("Movement","left")

	flyspeed = 50
	movement:AddSlider("Fly Speed",16,75,600,false,function(value)
		flyspeed = value
	end)

	--local flykeybind = Enum.KeyCode.M
    isflying = false

    local flytoggle = movement:AddToggle("Fly",false,function(value)
        isflying = value
        if infjump then infjump:Disconnect() end
        if value then
            infjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
                if plr.Character and plr.Character.Humanoid then
                    plr.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end)

	flytoggle:AddKeybind(Enum.KeyCode.M)
    --[[
	game:GetService("UserInputService").InputBegan:Connect(function(input)
		if game:GetService("UserInputService"):GetFocusedTextBox() then return end
		if input.KeyCode == flykeybind then
			if not isflying then
				isflying = true
				if infjump then infjump:Disconnect() end
				infjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
					if plr.Character and plr.Character.Humanoid then
						plr.Character.Humanoid:ChangeState("Jumping")
					end
				end)
			else
				isflying = false
				if infjump then infjump:Disconnect() end
			end
		end
	end)
    ]]
	
	

	local esp = yba:CreateSector("ESP","right")

	delay(0,function()
		_G.qESP_ENABLED = false
		_G.MAXDISTANCE = 10000 -- max distance in studs, default 10000 (10000 is as far as you randomseed)
		_G.REFRESHTIME = 2.5 -- time in seconds it takes to refresh and check for new players, default 2.5
		_G.SHOWHEALTHDECIMALS = false -- (WILL S OMETIMES SHOW TOO MANY DECIMALS) whether or not it shows decimals in the health text, default false
		_G.COLOREDHEALTHBAR = false -- kinda glitchy so turn it off if u want, default true
		_G.USERNAMEFONT = Enum.Font.Code -- search up "roblox fonts", default Enum.Font.Code
		_G.HEALTHBARTEXTFONT = Enum.Font.Code -- search up "roblox fonts", default Enum.Font.Code
		_G.USERNAMETEXTSIZE = 12 -- text size (will look best in increments of 4 or 8), default 12

		loadstring(game:HttpGet(("https://raw.githubusercontent.com/lolitsace/QexHubV2/main/Util/yba%20esp.lua"),true))()
	end)



	esp:AddToggle("Enabled",false,function(value)
		_G.qESP_ENABLED = value
	end)

	esp:AddSlider("Max Distance",10, 10000, 10000,false,function(value)
		_G.MAXDISTANCE = value
	end)

	esp:AddSlider("Text Size",1,12,32,false,function(value)
		_G.USERNAMETEXTSIZE = value
	end)

	esp:AddToggle("Show Health Decimals",false,function(value)
		_G.SHOWHEALTHDECIMALS = value
	end)

	--[[
	esp:AddToggle("Colored Health Bar",true,function(value)
		_G.COLOREDHEALTHBAR = value
	end)
	]]
	
	esp:AddSlider("Update Time",0.1,2.5,7.5,1,function(value)
		_G.REFRESHTIME = value
	end)

	esp:AddDropdown("Text Font",{"Legacy","Arial","SourceSans","SourceSansLight","Bodoni","Garamond","Cartoon","Code","Arcade","Fantasy","Gotham","AmaticSC","Ubuntu"},"Code",function(value)
		local font = Enum.Font.Code
		if value == "Legacy" then
			font = Enum.Font.Legacy
		elseif value == "Arial" then
			font = Enum.Font.Arial
		elseif value == "SourceSans" then
			font = Enum.Font.SourceSans
		elseif value == "SourceSansLight" then
			font = Enum.Font.SourceSansLight
		elseif value == "Bodoni" then
			font = Enum.Font.Bodoni
		elseif value == "Garamond" then
			font = Enum.Font.Garamond
		elseif value == "Cartoon" then
			font = Enum.Font.Cartoon
		elseif value == "Code" then
			font = Enum.Font.Code
		elseif value == "Arcade" then
			font = Enum.Font.Arcade
		elseif value == "Fantasy" then
			font = Enum.Font.Fantasy
		elseif value == "Gotham" then
			font = Enum.Font.Gotham
		elseif value == "AmaticSC" then
			font = Enum.Font.AmaticSC
		elseif value == "Ubuntu" then
			font = Enum.Font.Ubuntu
		end

		_G.USERNAMEFONT = font
		_G.HEALTHBARTEXTFONT = font
	end)

	local chams = yba:CreateSector("Chams","right")

    delay(0,function()
        _G.QexChams = false
        _G.ChamsColor = Color3.fromRGB(255,255,255)
        _G.ChamsTransparency = .75
        _G.QexChamsRefreshTime = .75
        
        local parts = {
            "LeftFoot",
            "LeftHand",
            "LeftLowerArm",
            "LeftLowerLeg",
            "LeftUpperArm",
            "LeftUpperLeg",
            "LowerTorso",
            "RightFoot",
            "RightHand",
            "RightLowerArm",
            "RightLowerLeg",
            "RightUpperArm",
            "RightUpperLeg",
            "UpperTorso",
            "Head",
            "Left Leg",
            "Left Arm",
            "Right Leg",
            "Right Arm",
            "Torso"
        }
        
        function chams(part,playername)
            if game:GetService("CoreGui"):FindFirstChild(playername.."_"..part.Name.."_QEXCHAM") then
                game:GetService("CoreGui")[playername.."_"..part.Name.."_QEXCHAM"]:Destroy()
            end
            
            if not _G.QexChams then return end
            
            local cham = Instance.new("BoxHandleAdornment",game:GetService("CoreGui"))
            cham.Color3 = _G.ChamsColor
            cham.Transparency = _G.ChamsTransparency
            cham.Adornee = part
            cham.AlwaysOnTop = true
            cham.Size = part.Size
            cham.ZIndex = 1
            cham.Visible = true
            cham.Name = playername.."_"..part.Name.."_QEXCHAM"
			game:GetService("Debris"):AddItem(cham,_G.QexChamsRefreshTime + .5)
        end
        
        while wait(_G.QexChamsRefreshTime) do
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= game:GetService("Players").LocalPlayer then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        for _,x in pairs(v.Character:GetChildren()) do
                            if table.find(parts,x.Name) then
                                chams(x,v.Name)
                            end
                        end
                    end
                end
            end
        end
    end)

    chams:AddToggle("Enabled",false,function(value)
		_G.QexChams = value
	end)

    chams:AddColorpicker("Chams Color",Color3.fromRGB(255,255,255),function(value)
        _G.ChamsColor = value
    end)

    chams:AddSlider("Transparency",0,0.75,1,2,function(value)
		_G.ChamsTransparency = value
	end)

    chams:AddSlider("Update Time",0.1,1,7.5,1,function(value)
		_G.QexChamsRefreshTime = value
	end)



	local itemespsec = yba:CreateSector("Item ESP","right")

	_G.QexYbaItemEsp_Enabled = false
	_G.QexYbaItemEsp_TextSize = 12
	_G.QexYbaItemEsp_MaxDistance = 10000

	function itemesp(part,partname,color)
		if part:FindFirstChild("QEXITEMESP") then
			part.QEXITEMESP:Destroy()
		end

		if _G.QexYbaItemEsp_Enabled == false then return end

		local bbgui = Instance.new("BillboardGui",part)
		bbgui.Size = UDim2.new(0,100,0,100)
		bbgui.MaxDistance = _G.QexYbaItemEsp_MaxDistance
		bbgui.AlwaysOnTop = true
		bbgui.Name = "QEXITEMESP"

		local text = Instance.new("TextLabel",bbgui)
		text.Name = "ITEMNAME"
		text.TextColor3 = color
		text.TextStrokeTransparency = 0
		text.Font = Enum.Font.Code
		text.Size = UDim2.new(1,0,1,0)
		text.TextSize = _G.QexYbaItemEsp_TextSize
		text.BackgroundTransparency = 1

		text.Text = partname.." ["..tostring(math.floor(plr:DistanceFromCharacter(part.Position))).."]"
	end

	delay(0,function()
		while wait(3) do
			for _,v in pairs(workspace.Item_Spawns:GetDescendants()) do
				if v and v.Parent then
					if v.Parent.Name == "Model" then
						if v.Name == "MeshPart" then
							if v:FindFirstChildOfClass("ParticleEmitter") then
								if v.Color ~= Color3.fromRGB(255,255,0) then
									itemesp(v,"Arrow",Color3.fromRGB(226, 141, 22))
								else
									itemesp(v,"Gold Coin",Color3.fromRGB(255, 255, 0))
								end
							end

							if v.MeshId == "rbxassetid://7218405255" then
								itemesp(v,"Rokakaka",Color3.fromRGB(200, 32, 32))
							end

							if v.Color == Color3.fromRGB(77, 181, 8) then
								itemesp(v,"Steel Ball",Color3.fromRGB(77, 181, 8))
							end

							if v.Color == Color3.fromRGB(110, 153, 202) then
								itemesp(v,"Diamond",Color3.fromRGB(110, 153, 202))
							end

							if v.Color == Color3.fromRGB(185, 183, 176) then
								itemesp(v,"Ribcage",Color3.fromRGB(185, 183, 176))
							end

							if v.MeshId == "rbxassetid://7138936196" then
								itemesp(v,"Quinton's Glove",Color3.fromRGB(255, 41, 41))
							end
						elseif v.Name == "Part" then
							if v.Color == Color3.fromRGB(163, 162, 165) then
								itemesp(v,"Ancient Scroll",Color3.fromRGB(175, 49, 17))
							end
						end
					end
				end
			end
		end
	end)

	itemespsec:AddToggle("Enabled",false,function(value)
		_G.QexYbaItemEsp_Enabled = value
	end)

	itemespsec:AddSlider("Text Size",1,12,32,false,function(value)
		_G.QexYbaItemEsp_TextSize = value
	end)

	itemespsec:AddSlider("Max Distance",5,10000,10000,false,function(value)
		_G.QexYbaItemEsp_MaxDistance = value
	end)



    local mainteleports = yba:CreateSector("Teleports","left")
	local teleports = yba:CreateSector("Map Teleports","left")

	mainteleports:AddButton("Click TP Item",function()
		if plr.Character then
			if plr.Backpack:FindFirstChild("TP") then plr.Backpack:FindFirstChild("Click TP"):Destroy() end
			if plr.Character:FindFirstChild("TP") then plr.Character:FindFirstChild("Click TP"):Destroy() end
			tool = Instance.new("Tool")
			tool.RequiresHandle = false
			tool.Name = "TP"
			tool.ToolTip = "Qex Hub"
			tool.Activated:connect(function()
				local pos = plr:GetMouse().Hit + Vector3.new(0,2.25,0)
				plr.Character:MoveTo(pos)
			end)
			tool.Parent = plr.Backpack
		end
	end)

	mainteleports:AddButton("Jesus",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			if workspace.Dialogues:FindFirstChild("Jesus") then
				plr.Character.HumanoidRootPart.CFrame = workspace.Dialogues.Jesus.HumanoidRootPart.CFrame
			else
				local warning = Instance.new("Message",game:GetService("CoreGui"))
				warning.Text = "Jesus is not spawned"
				game:GetService("Debris"):AddItem(warning,2.5)
			end
		end
	end)

    getgenv().TpToPlayerUsername = ""
    mainteleports:AddTextbox("Player Name","",function(value)
		TpToPlayerUsername = value
	end)

	mainteleports:AddButton("TP to Player",function()
		task.wait(0)
		if game:GetService("Players"):FindFirstChild(TpToPlayerUsername) then
			local tpplr = game:GetService("Players"):FindFirstChild(TpToPlayerUsername)
			if tpplr.Character and tpplr.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				plr.Character:MoveTo(tpplr.Character.HumanoidRootPart.Position + Vector3.new(0,3,0))
			end
		end
	end)

	teleports:AddButton("Island",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(309.362, 969.611, -2048.04))
		end
	end)

	teleports:AddButton("Train Station",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(741.081, 826.211, -194.912))
		end
	end)

	teleports:AddButton("Pesci",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(1515.81, 819.138, -4.741))
		end
	end)

	teleports:AddButton("Ice Cube",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(2251.910, 819.010, -129.046))
		end
	end)

	teleports:AddButton("Diavolo",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(159.389, 967.612, 975.134))
		end
	end)

	teleports:AddButton("Cafe",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-129.14, 827.39, 377.116))
		end
	end)

	teleports:AddButton("Hamon",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(1024.01, 866.611, -393.997))
		end
	end)

	teleports:AddButton("Pizzeria",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(324.354, 829.211, 25.1397))
		end
	end)

	teleports:AddButton("Heaven Arena",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(8551.84, 53.0202, 8138.31))
		end
	end)

	teleports:AddButton("SBR",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(532.256, 803.691, 518.065))
		end
	end)

	teleports:AddButton("Behind SBR",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(573.688, 803.011, 517.304))
		end
	end)

	teleports:AddButton("Inside Castle",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(126.36, 886.611, 976.615))
		end
	end)

	teleports:AddButton("Greatest Height",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(1282.34, 1142.61, -37.9745))
		end
	end)
	
	teleports:AddButton("Falsmas Dimension",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-4.76636, 767.613, 64.3563))
		end
	end)

	teleports:AddButton("Vampire Hideout",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(133, 730, 351))
		end
	end)

	teleports:AddButton("Bruno Boss",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(934, 812, 13))
		end
	end)

	teleports:AddButton("Top of Pizzeria",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(347, 889, 44))
		end
	end)

	teleports:AddButton("Top of Cafe",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-153, 894, 375))
		end
	end)

	teleports:AddButton("Cafe Back Room",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-112, 827, 416))
		end
	end)

	teleports:AddButton("Joe Boss",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-245, 771, 964))
		end
	end)

	teleports:AddButton("Darius",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(431, 888, -290))
		end
	end)

	teleports:AddButton("Fugo",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(1089, 850, -255))
		end
	end)

	teleports:AddButton("Pluck",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(10, 885, -196))
		end
	end)

	teleports:AddButton("Boxing",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-40, 827, 420))
		end
	end)

	teleports:AddButton("Leaky Eye Luca",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(451, 826, 46))
		end
	end)

	teleports:AddButton("Top of Arcade",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-122, 855, -24))
		end
	end)

	teleports:AddButton("Dracula",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(84, 736, 27))
		end
	end)

	teleports:AddButton("Zombie Henchmen",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(174, 669, 98))
		end
	end)

	teleports:AddButton("ABD",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-25.829, 9049.362, -8657.92))
		end
	end)

	teleports:AddButton("Kamui",function()
		if plr.Character and plr.Character.HumanoidRootPart then
			plr.Character:MoveTo(Vector3.new(-2721.17, 11360.4, 219861))
		end
	end)
end
--[[
if game.PlaceId == 7186363515 then -- A Legacy Time
	local alt = window:page({name = "ALT"})
	local af = alt:section({name = "Auto Farm",side = "left",size = 500})

	delay(0,function()
		while wait(.1) do
			if _G.qAF_ENABLED then
				pcall(function()
					for _,v in pairs(workspace.Items:GetChildren()) do
						if v:IsA("Tool") and v:FindFirstChild("Handle") then
							v.Handle.Anchored = true
							wait()
							v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
							v.Handle.Anchored = false
						end
					end
				end)
			end
		end
	end)

	af:AddToggle("Enabled",false,function(value)
		_G.qAF_ENABLED = value
	end)
end
]]
if game:GetService("Lighting"):FindFirstChild("TS") and game:GetService("Lighting"):FindFirstChild("Timestop") then -- ABD copies
	local alt = window:page({name = "ABD"})
	local af = alt:section({name = "Auto Farm",side = "left",size = 500})

	delay(0,function()
		while wait(.1) do
			if _G.qAF_ENABLED then
				pcall(function()
					for _,v in pairs(workspace.Items:GetChildren()) do
						if v:IsA("Tool") and v:FindFirstChild("Handle") then
							v.Handle.Anchored = true
							wait()
							v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
							v.Handle.Anchored = false
						end
					end
				end)
			end
		end
	end)

	af:AddToggle("Enabled",false,function(value)
		_G.qAF_ENABLED = value
	end)
end

if game.PlaceId == 6751580221 then -- Verdant Moon
	--[[ no fall
	local Hook
	Hook = hookmetamethod(game,"__namecall",function(self,...)
		local Args = {...}
			if getnamecallmethod() == "FireServer" and self.Name == "fall" then
				return
			end
		return Hook(self,...)
	end)
	--]]

	-- staff notify
	delay(0,function()
		local staff = {
			"iltria", -- #1 enemy
			
			"DutchMisfit",
			"timothy_teakettle",
			"gatronks",
			"sargentsteveEr",
			"Scronkly",
			
			"LemonScented_60",
			"eightsystem",
			"rueghost",
			"sbliz",
			"bincent",
			"Saelent",
			
			"ZelInfernos",
			"Harmonykills"
		}
		
		while task.wait(5) do
			table.foreach(staff,function(a,b)
				for _,v in pairs(game:GetService("Players"):GetChildren()) do
					if v.Name == b then
						game:GetService("StarterGui"):SetCore("SendNotification", {
							Title = "Moderator Detected",
							Text = "High-ranked member of iltria's group detected: "..v.Name,
							Duration = 4.5
						})
					end
				end
			end)
		end
	end)
	--

	----------------------------------------------------------
	-- spectate
	local isSpectating = false
	function spectatePlayer(player)
        if isSpectating then
            if game.Players.LocalPlayer.Character then
                isSpectating = false
                workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
            end
        return end
        
        isSpectating = true
        if player.Character then
            workspace.CurrentCamera.CameraSubject = player.Character
        end
    end

	delay(0,function()
		while wait(5) do
			if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("LeaderboardNew") then return end
			if not game.Players.LocalPlayer.PlayerGui.LeaderboardNew:FindFirstChild("leadFrame") then return end
			if not game.Players.LocalPlayer.PlayerGui.LeaderboardNew.leadFrame:FindFirstChild("ScrollingFrame") then return end
			for _,v in pairs(game.Players.LocalPlayer.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame:GetChildren()) do
				if v.Name ~= "UIListLayout" and game:GetService("Players"):FindFirstChild(v.Name) and not game:GetService("Players"):FindFirstChild(v.Name):FindFirstChild("QEX_WATCHINGFORSPECTATEINPUT") then
					local tag = Instance.new("Folder",game:GetService("Players"):FindFirstChild(v.Name))
					tag.Name = "QEX_WATCHINGFORSPECTATEINPUT"
					v.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							spectatePlayer(game:GetService("Players"):FindFirstChild(v.Name))
						end
					end)
				end
			end
		end
	end)
	----------------------------------------------------------

	local vm = window:CreateTab("Verdant Moon")
	local main = vm:CreateSector("Main","left")

	local nofallval = true
	main:AddToggle("No Fall",true,function(value)
		nofallval = value
	end)
	
	local Hook
	Hook = hookmetamethod(game,"__namecall",function(self,...)
		local Args = {...}
			if getnamecallmethod() == "FireServer" and self.Name == "fall" and nofallval then
				return
			end
		return Hook(self,...)
	end)

	local showhealthbars = true
	main:AddToggle("Show Health Bars",true,function(value)
		showhealthbars = value
	end)
	delay(0,function()
		while wait(1.25) do
			if showhealthbars == true then
				for _,v in pairs(workspace.Live:GetChildren()) do
					if v and v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") then
						local vhum = v:FindFirstChildOfClass("Humanoid")
						pcall(function()
						vhum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
						vhum.HealthDisplayDistance = 70
						vhum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
						end)
					end
				end
			else
				for _,v in pairs(workspace.Live:GetChildren()) do
					if v and v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") then
						local vhum = v:FindFirstChildOfClass("Humanoid")
						pcall(function()
						vhum.HealthDisplayDistance = 0
						vhum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
						end)
					end
				end
			end
		end
	end)

	main:AddButton("Q Exploits Mode",function()
		getgenv().name = "q exploits"


		local Plr = game.Players.LocalPlayer
		for Index, Value in next, game:GetDescendants() do 
			if Value.ClassName == "TextLabel" then 
				local has = string.find(Value.Text,Plr.Name) 
				if has then 
					local str = Value.Text:gsub(Plr.Name,name)
					Value.Text = str 
				end
				Value:GetPropertyChangedSignal("Text"):Connect(function()
					local str = Value.Text:gsub(Plr.Name,name)
					Value.Text = str 
				end)
			end
		end

		game.DescendantAdded:Connect(function(Value)
			if Value.ClassName == "TextLabel" then 
				local has = string.find(Value.Text,Plr.Name)
				Value:GetPropertyChangedSignal("Text"):Connect(function()
					local str = Value.Text:gsub(Plr.Name,name)
					Value.Text = str 
				end)
				if has then 
					local str = Value.Text:gsub(Plr.Name,name)
					Value.Text = str 
				end
				
			end
		end)

		while wait(.35) do
			Plr.PlayerGui.statusGui.StatusGui.Frame.hpBarBg.RealFrame.hpBar.BackgroundColor3 = Color3.fromRGB(255, 75, 200)
			if Plr.PlayerGui.statusGui.StatusGui.Frame.hpBarBg.RealFrame.hpBar:FindFirstChildOfClass("UIGradient") then
				Plr.PlayerGui.statusGui.StatusGui.Frame.hpBarBg.RealFrame.hpBar:FindFirstChildOfClass("UIGradient"):Destroy()
			end
			
			Plr.PlayerGui.statusGui.StatusGui.Frame.nameField.Text = name..", the Grim Reaper"
			Plr.PlayerGui.statusGui.StatusGui.Frame.nameField.TextColor3 = Color3.fromRGB(200,0,70)
			Plr.PlayerGui.statusGui.StatusGui.Frame.nameField.TextStrokeColor3 = Color3.fromRGB(90,0,0)
			Plr.PlayerGui.statusGui.StatusGui.Frame.nameField.TextStrokeTransparency = 0
			
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].playerName.Text = name..", the Grim Reaper"
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].playerName.TextColor3 = Color3.fromRGB(200,0,70)
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].playerName.TextStrokeColor3 = Color3.fromRGB(90,0,0)
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].playerName.TextStrokeTransparency = 0
			
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].bounty.Text = "999 ❖"
			Plr.PlayerGui.LeaderboardNew.leadFrame.ScrollingFrame[Plr.Name].bounty.TextColor3 = Color3.fromRGB(200,0,0)
		end
	end)

	--local autosprint = false
	--main:AddToggle("Auto Sprint",true,function(value)
	--	autosprint = value
	--end)

	delay(0,function()
		while wait(.125) do
			if autosprint == true then
				if plr.Character and plr.Character.LegacyScripts and plr.Character.LegacyScripts.RunningScript and plr.Character.LegacyScripts.RunningScript.run then
					plr.Character.LegacyScripts.RunningScript.run:FireServer(true)
				end
			end
		end
	end)

	local trinketesp = vm:CreateSector("Trinkets","right")

	trinketesp:AddButton("Enable Trinket ESP",function(value)
		delay(0,function()
			---------------------------------------------------------
			---------------------------------------------------------
			local mouse = game.Players.LocalPlayer:GetMouse()
			local EspOn = true
	
			local Drawings = {}
			-- Drawings[1].Part
			-- Drawings[1].Drawing
	
			local function checkproperty(Object, Property)
				local toreturn = pcall(function()
					if typeof(Object[Property]) == "Instance" then
						error()
					end
				end)
				return toreturn
			end
	
			local function mark(part, txt, color, outlinecolor)
				if part == nil or txt == nil then
					return
				end
				if not checkproperty(part, "Position") then
					print("Cannot mark, selected object has no position property")
				end
				local TableAddition = {}
				local NewDrawing = Drawing.new("Text")
				NewDrawing.Size = 16
				NewDrawing.Visible = true
				NewDrawing.Outline = true
				NewDrawing.Center = true
				NewDrawing.Text = tostring(txt)
				if outlinecolor ~= nil then
					NewDrawing.OutlineColor = Color3.new(outlinecolor.R/255,outlinecolor.G/255,outlinecolor.B/255)
				else
					NewDrawing.OutlineColor = Color3.new(255,0,0)
				end
				if color ~= nil then
					NewDrawing.Color = Color3.new(color.R/255,color.G/255,color.B/255)
				end
				TableAddition.Part = part
				TableAddition.Drawing = NewDrawing
				table.insert(Drawings, TableAddition)
				part.AncestryChanged:Connect(function(old, new)
					if old == nil or new == nil then
						part:Destroy()
					end
				end)
			end
	
			game:GetService("RunService").RenderStepped:Connect(function()
				if EspOn and not EspDebounce then
					EspDebounce = true
					for i,v in pairs(Drawings) do
						if v.Drawing ~= nil then
							if v.Part ~= nil and v.Part.Parent ~= nil then
								local ScreenPos,OnScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Part.Position)
								if OnScreen and game.Players.LocalPlayer:DistanceFromCharacter(v.Part.Position) <= 1000 or OnScreen and v.Drawing.Text == "Spell Book" or OnScreen and v.Drawing.Text == "Mana Crystal" then
									v.Drawing.Visible = true
									v.Drawing.Position = Vector2.new(ScreenPos.X,ScreenPos.Y)
								else
									v.Drawing.Visible = false
								end
								if v.Part.Parent ~= nil and v.Part.Parent:FindFirstChildOfClass("ClickDetector") then
									if game.Players.LocalPlayer:DistanceFromCharacter(v.Part.Position) <= 10 then
										if _G.VERDANTMOONAUTOTRINKETPICKUP == true then
											fireclickdetector(v.Part.Parent:FindFirstChildOfClass("ClickDetector"))
										end
									end
								end
							else
								v.Drawing.Visible = false
								v.Drawing:Remove()
								table.remove(Drawings, i)
							end
						end
					end
					game:GetService("RunService").RenderStepped:Wait()
					EspDebounce = false
				end
			end)
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "Handle" and v:FindFirstAncestor("TrinketSpawn") then
					if v.ClassName == "MeshPart" then
						local ColorInRbg = Color3.new(v.Color.R*255,v.Color.G*255,v.Color.B*255)
						if v.MeshId == "rbxassetid://7249636576" then
							mark(v,"Gem", ColorInRbg, ColorInRbg)
						elseif v.MeshId == "rbxassetid://6967864980" then
							mark(v,"Mana Crystal", ColorInRbg, ColorInRbg)
						end
					elseif tostring(v.BrickColor) == "Lily white" then
						mark(v,"Spell Book",Color3.new(0,0,0),Color3.new(255,255,255))
					else
						mark(v,"Trinket")
					end
				end
			end
			game.Workspace.DescendantAdded:Connect(function(v)
				if v.Name == "Handle" and v:FindFirstAncestor("TrinketSpawn") then
					if v.ClassName == "MeshPart" then
						local ColorInRbg = Color3.new(v.Color.R*255,v.Color.G*255,v.Color.B*255)
						if v.MeshId == "rbxassetid://7249636576" then
							mark(v,"Gem", ColorInRbg, ColorInRbg)
						elseif v.MeshId == "rbxassetid://6967864980" then
							mark(v,"Mana Crystal", ColorInRbg, ColorInRbg)
						end
					elseif tostring(v.BrickColor) == "Lily white" then
						mark(v,"Spell Book",Color3.new(0,0,0),Color3.new(255,255,255))
					else
						mark(v,"Trinket")
					end
				end
			end)
			---------------------------------------------------------
			---------------------------------------------------------
		end)
	end)

	trinketesp:AddToggle("Auto Trinket Pickup",false,function(value)
		_G.VERDANTMOONAUTOTRINKETPICKUP = value
	end)

	--[[
	local movement = vm:CreateSector("Movement","left")

	flyspeed = 60
	movement:AddSlider("Fly Speed",16,60,60,false,function(value)
		flyspeed = value
	end)

	--local flykeybind = Enum.KeyCode.M
    isflying = false

    local flytoggle = movement:AddToggle("Fly",false,function(value)
        isflying = value
		if plr.Character and plr.Character.Humanoid then
			plr.Character.Humanoid.AutoRotate = not value
		end
        if infjump then infjump:Disconnect() end
        if value then
            infjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
                if plr.Character and plr.Character.Humanoid then
                    plr.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end)
	flytoggle:AddKeybind(Enum.KeyCode.H)
	



	local ncloop = nil
	local nctoggle = movement:AddToggle("Noclip",false,function(value)
		if value then
			task.wait(0.075)
			local function ncloopfunc()
				if plr.Character ~= nil then
					for _, v in pairs(plr.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == true then
							v.CanCollide = false
						end
					end
				end
			end
			ncloop = game:GetService('RunService').Stepped:Connect(ncloopfunc)
		else
			if ncloop then ncloop:Disconnect() end
		end
	end)
	nctoggle:AddKeybind(Enum.KeyCode.H)
	]]
end

if game.PlaceId == 5094651510 then -- Demonfall
	local tab = window:CreateTab("Demonfall")
	local main = tab:CreateSector("Main","left")

	local nostun = false
	game:GetService("RunService").RenderStepped:Connect(function()
		if plr.Character and nostun == true then 
			for _,v in next, plr.Character:GetChildren() do 
				if v.Name == "Stun" then 
					v:Destroy()
				end 
			end 
		end
	end)

	main:AddToggle("Default Cursor",true,function(value)
		game:GetService("UserInputService").MouseIconEnabled = value
	end)

	main:AddToggle("No Stun",false,function(value)
		nostun = false
	end)

	local nowpcd = false
	game:GetService("RunService").RenderStepped:Connect(function()
		if plr.Character and nowpcd == true then 
			for _,v in next, plr.Character:GetChildren() do 
				if v.Name == "SequenceCooldown" or v.Name == "HeavyCooldown" then 
					v:Destroy()
				end 
			end 
		end
	end)

	main:AddToggle("No Weapon Endlag",false,function(value)
		nowpcd = value
	end)

	local antikbtoggle = main:AddToggle("Anti Knockback",false,function(value) end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if antikbtoggle:Get() == true and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			for _,v in pairs(plr.Character.HumanoidRootPart:GetChildren()) do
				if v.ClassName == "BodyForce" or v.ClassName == "BodyGyro" or v.ClassName == "BodyPosition" or v.ClassName == "BodyVelocity" then
					v:Destroy()
				end
			end
		end
	end)

	main:AddButton("Calculate Trinket Price",function()
		local inv = plr.PlayerGui.Interface.HUD.MenuFrames.Inventory.Content:GetChildren()
		local price = game:GetService("ReplicatedStorage").Trinkets
		local cal_price = 0

		local function add_price(itemname,amount)
			local item = price:FindFirstChild(itemname)
			if item then
				if not amount  then
					amount = 1
				end
				cal_price = cal_price + (item.Configuration.Price.Value * amount)
			end
		end
		for i,v in next,inv do
			AMT = 1
			if v:FindFirstChild("Amount") then
				AMT = tonumber(v:FindFirstChild("Amount").Text)
			end
			add_price(v.Name,AMT)
		end

		local warning = Instance.new("Message",game:GetService("CoreGui"))
		warning.Text = "Qex Hub\nThe total sell price of your trinkets is $"..tostring(cal_price)
		game:GetService("Debris"):AddItem(warning,2.75)
	end)

	main:AddButton("Show Health",function()
		shared.auto_update_npcs = true

		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Players = game:GetService("Players")
		local HPBarTemplate = ReplicatedStorage.UI:FindFirstChild("EnemyGui")
		if HPBarTemplate then HPBarTemplate = HPBarTemplate:Clone() else return end

		local function onCharacterAdded(Character, Player, Format)
			local Head = Character:WaitForChild("Head")
			if Head:FindFirstChild("EnemyGui") then return end

			local HPBar = HPBarTemplate:Clone()
			HPBar.MaxDistance = 500
			HPBar.Health.TextLabel.Text = Player.Name
			HPBar.Health.Bar.Size = UDim2.new(Character.Health.Value / Player.MaxHealth.Value, 0, 1, 0)
			HPBar.Parent = Head
			
			if Format then
				local Name = Player.Name:gsub("(%l)(%u)","%1 %2")
				if Player.MaxHealth.Value > 100 then
					HPBar.Health.TextLabel.Text = Name .. " 👑"
				else
					HPBar.Health.TextLabel.Text = Name
				end
			end
			
			local TextLabel = Instance.new("TextLabel")
			TextLabel.Text = ("%d/%d"):format(math.floor(Character.Health.Value), math.floor(Player.MaxHealth.Value))
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.BackgroundTransparency = 1
			TextLabel.TextScaled = true
			TextLabel.Size = UDim2.new(1, 0, 1, 0)
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.Parent = HPBar.Health
			
			Character.Health:GetPropertyChangedSignal("Value"):Connect(function()
				local Health = Character.Health.Value
				local MaxHealth = Player.MaxHealth.Value
				
				HPBar.Health.Bar:TweenSize(UDim2.new(Health / MaxHealth, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true)
				TextLabel.Text = ("%d/%d"):format(Character.Health.Value, Player.MaxHealth.Value)
			end)
		end

		local function onPlayerAdded(Player)
			local Character = Player.Character or Player.CharacterAdded:Wait()
			
			if Character then
				onCharacterAdded(Character, Player)
			end
			
			Player.CharacterAdded:Connect(function(Character)
				onCharacterAdded(Character, Player)
			end)
		end

		Players.PlayerAdded:Connect(onPlayerAdded)
		for _, Player in ipairs(Players:GetPlayers()) do
			coroutine.wrap(onPlayerAdded)(Player)
		end

		workspace.ChildAdded:Connect(function(childObject)
			local humanoidModel = childObject:WaitForChild("Head", math.huge)
			if humanoidModel and childObject:WaitForChild("MaxHealth", 10) then
				coroutine.wrap(onCharacterAdded)(childObject, childObject, true)
			end
		end)

		for _, Model in ipairs(workspace:GetChildren()) do
			local Head = Model:FindFirstChild("Head")
			if Head and Model:FindFirstChild("MaxHealth") then
				coroutine.wrap(onCharacterAdded)(Model, Model, true)
			end
		end

		while true do
			if shared.auto_update_npcs then
				for _, Model in ipairs(workspace:GetChildren()) do
					local Head = Model:FindFirstChild("Head")
					if Head and Model:FindFirstChild("MaxHealth") then
						coroutine.wrap(onCharacterAdded)(Model, Model, true)
					end
				end
			end
			wait(5)
		end
	end)

	local nofall = true
	local nofalltoggle = main:AddToggle("No Fall",true,function(value)
		nofall = value
	end)

	main:AddButton("God Mode",function()
		if nofalltoggle:Get() == true then
			nofalltoggle:Set(false)
			wait()
			game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", math.acos(50))
			wait()
			nofalltoggle:Set(true)
		elseif nofalltoggle:Get() == false then
			game:GetService("ReplicatedStorage").Remotes.Async:FireServer("Character", "FallDamageServer", math.acos(50))
		else
			plr:Kick("Attempt to spoof Qex Hub values")
		end
	end)

	delay(0,function()
		local ONC
		ONC = hookmetamethod(game, "__namecall", function(Self, ...)
		local method = getnamecallmethod()
		local args = { ... }
		if method == "FireServer" and args[2] == "FallDamageServer" and nofall then return end
		return ONC(Self, ...)
		end)
	end)

	local infstam = false
	main:AddToggle("Anti Movement Stamina Loss",false,function(value)
		infstam = value
	end)

	delay(0,function()
		local ONC
		ONC = hookmetamethod(game, "__namecall", function(Self, ...)
		local method = getnamecallmethod()
		local args = { ... }
		if method == "FireServer" and args[2] == "StaminaLoss" and infstam then return end
		return ONC(Self, ...)
		end)
	end)

	local antisun = false
	main:AddToggle("No Sun Damage (Demon)",false,function(value)
		antisun = value
	end)

	delay(0,function()
		local old_name_call
		old_name_call = hookmetamethod(game, "__namecall", function(self, ...)
			local args = {...}
			if getnamecallmethod() == "FindPartsInRegion3WithWhiteList" and getcallingscript().Name == "Character" and antisun then
				return FindPartsInRegion3WithIgnoreList(args[1], {game.Players.LocalPlayer.Character}, args[3])
			end
			return old_name_call(self, ...)
		end)
	end)

	game:GetService("Lighting"):WaitForChild("Atmosphere")
	local atmosphere = game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere")
	main:AddToggle("No Fog",false,function(value)
		game:GetService("Lighting").FogStart = 9999999
		game:GetService("Lighting").FogEnd = 10000000
		if value then
			atmosphere.Parent = nil
		else
			atmosphere.Parent = game:GetService("Lighting")
		end
	end)

	main:AddToggle("No Weather Effects",false,function(value)
		for _,v in pairs(workspace.Folder:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = not value
			end
		end
	end)

end

if game.PlaceId == 6073601949 then -- Dynasty: Battlegrounds Alpha
	local tab = window:CreateTab("Dynasty")
	local main = tab:CreateSector("Main","left")

	main:AddButton("Infinite Stamina",function() -- skidded lol
		local mt = getrawmetatable(game)
		make_writeable(mt)
		local old_index = mt.__index
		mt.__index = function(self,key)
		if tostring(self) == "Energy" then
		if tostring(key) == "Value" then
		return 100
		end
		end
		return old_index(self,key)
		end
	end)

	local atmo = game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere")
	main:AddToggle("No Fog",false,function(val)
		if val then
			atmo.Parent = nil
		else
			atmo.Parent = game:GetService("Lighting")
		end
	end)

	local act = false
	main:AddToggle("Anti Combat Tag",false,function(val)
		act = val
	end)

	main:AddButton("Redeem All Codes",function()
		wait(.5)
		game.ReplicatedStorage.Remotes.CodeRemote:FireServer("250kVisits")
		wait(1)
		game.ReplicatedStorage.Remotes.CodeRemote:FireServer("HalfAMilVisits")
		wait(1)
		game.ReplicatedStorage.Remotes.CodeRemote:FireServer("750k")
		wait(1)
		game.ReplicatedStorage.Remotes.CodeRemote:FireServer("AThousandLikes")
		wait(1)
		game.ReplicatedStorage.Remotes.CodeRemote:FireServer("ATonOfLikes")
	end)

	delay(0,function()
		while task.wait(.1) do
			if act then
				game:GetService("ReplicatedStorage").Remotes.CombatLog:FireServer(false)
			end
		end
	end)

	local FL = workspace:WaitForChild("FallLimit")
	local WL = workspace:WaitForChild("WaterLevel")
	local swimmablewatertoggle = main:AddToggle("Swimmable Water",false,function(val)
		if val then
			FL.Parent = nil
			WL.Parent = nil
			pcall(function()
				plr.Character.WaterKill:Destroy()
			end)
		else
			FL.Parent = workspace
			WL.Parent = workspace
		end
	end)

	delay(0,function()
		while task.wait(3) do
			if swimmablewatertoggle:Get() then
				pcall(function()
					plr.Character.WaterKill:Destroy()
				end)
			end
		end
	end)
end
-------------------------------------------------------

local player = window:CreateTab("Player")
local movement = player:CreateSector("Movement","left")

local maxwssliderval = 500
if game.PlaceId == 6751580221 then
	maxwssliderval = 60
end
if game.PlaceId == 5094651510 then
	maxwssliderval = 90
end
if game.PlaceId == 6073601949 then
	maxwssliderval = 19
end
local ws = 16
movement:AddSlider("WalkSpeed",0,16,maxwssliderval,false,function(value)
	if plr.Character then
		if plr.Character.Humanoid then
			plr.Character.Humanoid.WalkSpeed = value
			ws = value
		end
	end
end)

local jp = 50
movement:AddSlider("JumpPower",0,50,300,false,function(value)
	if plr.Character then
		if plr.Character.Humanoid then
			plr.Character.Humanoid.UseJumpPower = true
			plr.Character.Humanoid.JumpPower = value
			jp = value
		end
	end
end)

local LoopWS = false
local LoopJP = false
local LoopGrav = false

local loopwstoggle = movement:AddToggle("Loop WalkSpeed",false,function(value)
	LoopWS = value
end)
loopwstoggle:AddKeybind(nil)

local loopjptoggle = movement:AddToggle("Loop JumpPower",false,function(value)
	LoopJP = value
end)
loopjptoggle:AddKeybind(nil)

local predictedhipheight = 0
if plr.Character and plr.Character.Humanoid then
	predictedhipheight = plr.Character.Humanoid.HipHeight
end
movement:AddSlider("Hip Height",0,predictedhipheight or 0,35,1,function(value)
	if plr.Character then
		if plr.Character.Humanoid then
			plr.Character.Humanoid.HipHeight = value
		end
	end
end)

movement:AddButton("Sit",function()
	if plr.Character then
		if plr.Character.Humanoid then
			plr.Character.Humanoid.Sit = true
		end
	end
end)

local ncloop = nil
local nctoggle = movement:AddToggle("Noclip",false,function(value)
	if value then
		task.wait(0.075)
		local function ncloopfunc()
			if plr.Character ~= nil then
				for _, v in pairs(plr.Character:GetDescendants()) do
					if v:IsA("BasePart") and v.CanCollide == true then
						v.CanCollide = false
					end
				end
			end
		end
		ncloop = game:GetService('RunService').Stepped:Connect(ncloopfunc)
	else
		if ncloop then ncloop:Disconnect() end
	end
end)
nctoggle:AddKeybind(nil)

local infjumptoggle = movement:AddToggle("Infinite Jump",false,function(value)
	local chr = plr.Character
	if value then
		if infjump then infjump:Disconnect() end
		infjump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
			if plr.Character and plr.Character.Humanoid then
				plr.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	else
		if infjump then infjump:Disconnect() end
	end
end)
infjumptoggle:AddKeybind(nil)

local hrpAnchored = false
local anchortoggle = movement:AddToggle("Anchor",false,function(value)
	hrpAnchored = value
end)
anchortoggle:AddKeybind(nil)



movement:AddToggle("Trip",false,function(value)
	local chr = plr.Character
	if value then
		if plr.Character or plr.Character.Humanoid then
			plr.Character.Humanoid.PlatformStand = true
		end
	else
		if plr.Character or plr.Character.Humanoid then
			plr.Character.Humanoid.PlatformStand = false
		end
	end
end)

movement:AddToggle("Rotate",true,function(value)
	local chr = plr.Character
	if value then
		if plr.Character or plr.Character.Humanoid then
			plr.Character.Humanoid.AutoRotate = true
		end
	else
		if plr.Character or plr.Character.Humanoid then
			plr.Character.Humanoid.AutoRotate = false
		end
	end
end)

local gravval = 196.2
movement:AddSlider("Gravity",0.1,196.2,1000,1,function(value)
	workspace.Gravity = value
	gravval = value
end)
local gravval = 196.2

local loopgravtoggle = movement:AddToggle("Loop Gravity",false,function(value)
	LoopGrav = value
end)
loopgravtoggle:AddKeybind(nil)
local gravval = 196.2



local general = player:CreateSector("General","right")

local antiidle = true
general:AddToggle("Anti-Idle Kick",true,function(value)
	antiidle = value
end)
game:GetService("Players").LocalPlayer.Idled:Connect(function()
	if antiidle == true then
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end
end)

local minzdist = plr.CameraMinZoomDistance
local maxzdist = plr.CameraMaxZoomDistance
general:AddSlider("Min Zoom Distance",0.5,plr.CameraMinZoomDistance,25,1,function(value)
	plr.CameraMinZoomDistance = value
	minzdist = value
end)
plr.CameraMinZoomDistance = .5
local max_mzdist = 7500
if game.PlaceId == 7186363515 then
	max_mzdist = 1000
end
general:AddSlider("Max Zoom Distance",10,plr.CameraMaxZoomDistance,max_mzdist,false,function(value)
	plr.CameraMaxZoomDistance = value
	maxzdist = value
end)
general:AddButton("F3X",function()
	loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)
general:AddButton("Fix Camera",function()
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until plr.Character ~= nil
	workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	plr.CameraMinZoomDistance = minzdist
	plr.CameraMaxZoomDistance = maxzdist
	plr.CameraMode = "Classic"
	plr.Character.Head.Anchored = false
end)
general:AddToggle("Shift Lock Enabled",plr.DevEnableMouseLock,function(value)
	plr.DevEnableMouseLock = value
end)
general:AddButton("Noclip Camera",function()
	local sc = (debug and debug.setconstant) or setconstant
	local gc = (debug and debug.getconstants) or getconstants
	if not sc or not getgc or not gc then
		return
	end
	local pop = plr.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end
end)
local antivel = false
general:AddToggle("Anti Velocity",false,function(value)
	antivel = value
end)

--[[
if antivel and plr.Character then
	for _,v in pairs(plr.Character:GetDescendants()) do
		if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("RocketPropulsion") or v:IsA("BodyThrust") or v:IsA("BodyAngularVelocity") or v:IsA("AngularVelocity") or v:IsA("BodyForce") or v:IsA("VectorForce") or v:IsA("LineForce") then
			v:Destroy()
		end
	end
end
]]

general:AddButton("Delete Invisible Parts",function()
	for _,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.Transparency == 1 and v.CanCollide then
			v:Destroy()
		end
	end
end)
general:AddButton("BTools",function()
	Instance.new("HopperBin", plr:FindFirstChildOfClass("Backpack")).BinType = 1
	Instance.new("HopperBin", plr:FindFirstChildOfClass("Backpack")).BinType = 2
	Instance.new("HopperBin", plr:FindFirstChildOfClass("Backpack")).BinType = 3
	Instance.new("HopperBin", plr:FindFirstChildOfClass("Backpack")).BinType = 4
end)
general:AddLabel('Set a keybind to Instant Log!')
local instalogbutton = general:AddToggle("Instant Log",false,function(value)
	if value == true then
		plr:Kick("Instant Log")
	end
end)
instalogbutton:AddKeybind(nil)

general:AddSlider("FPS Cap",5,144,360,false,function(value)
	pcall(setfpscap, value)
end)

general:AddSlider("Replication Lag",0,0,15,false,function(value)
	settings():GetService("NetworkSettings").IncomingReplicationLag = value
end)

general:AddButton("Unlock Workspace",function()
	for _,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
	end
end)

general:AddButton("Copy Position",function()
	local char = plr.Character
	local pos = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart"))
	pos = pos and pos.Position
	local roundedPos = math.round(pos.X) .. ", " .. math.round(pos.Y) .. ", " .. math.round(pos.Z)
	setclipboard(roundedPos)
end)

general:AddButton("Suicide",function()
	if plr.Character then plr.Character:BreakJoints() end
end)

general:AddButton("Respawn Character",function()
	local char = plr.Character
	if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()
end)

general:AddButton("Refresh Character",function()
	local Human = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
	local pos = Human and Human.RootPart and Human.RootPart.CFrame
	local pos1 = workspace.CurrentCamera.CFrame
	
	local char = plr.Character
	if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()

	task.spawn(function()
		plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
	end)
end)



general:AddButton("Fake Avatar",function()
	if plr.Character and plr.Character.Humanoid and plr.Character.HumanoidRootPart then
		local chr = plr.Character
		for _,v in pairs(chr:GetChildren()) do
			if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
			end
		end
		chr.Head:FindFirstChildOfClass("Decal").Texture = "http://www.roblox.com/asset/?id=8740651056"

		local hat = Instance.new("Accessory",chr)
		hat.Name = "GanymedeHat"
		hat.AttachmentForward = Vector3.new(0, -0.151, -0.989)
		hat.AttachmentPos = Vector3.new(0.05, -0.3, 0)
		hat.AttachmentRight = Vector3.new(1, 0, 0)
		hat.AttachmentUp = Vector3.new(0, 1.32, -0.151)

		local handle = Instance.new("Part",hat)
		handle.CanCollide = false
		handle.Massless = false
		handle.Anchored = false
		handle.Size = Vector3.new(3, 1.6, 3)
		handle.Orientation = Vector3.new(8.68, 0, 0)
		handle.Name = "Handle"

		local hatattachment = Instance.new("Attachment",handle)
		hatattachment.Name = "HatAttachment"
		hatattachment.Position = Vector3.new(0.05, -0.201, -0.015)
		--hatattachment.Axis = Vector3.new(1, -0, 0)
		--hatattachment.SecondaryAxis = Vector3.new(0, 0.989, -0.151)

		local weld = Instance.new("Weld",handle)
		weld.Name = "AccessoryWeld"
		weld.Part0 = handle
		weld.Part1 = chr.Head
		weld.C1 = CFrame.new(0, 0.750000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

		local mesh = Instance.new("SpecialMesh",handle)
		mesh.MeshType = Enum.MeshType.FileMesh
		mesh.MeshId = "http://www.roblox.com/asset/?id=12811687"
		mesh.TextureId = "http://www.roblox.com/asset/?id=12811694"
		mesh.Scale = Vector3.new(1, 1, 1.1)

		local shirt = Instance.new("Shirt",chr)
		shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=5150609029"
		local pants = Instance.new("Pants",chr)
		pants.PantsTemplate = "http://www.roblox.com/asset/?id=5150610366"

		local bc = chr:FindFirstChildOfClass("BodyColors")
		if bc then
			bc.HeadColor3 = Color3.new(0,0,0)
			bc.TorsoColor3 = Color3.new(0,0,0)
			bc.LeftArmColor3 = Color3.new(0,0,0)
			bc.RightArmColor3 = Color3.new(0,0,0)
			bc.LeftLegColor3 = Color3.new(0,0,0)
			bc.RightLegColor3 = Color3.new(0,0,0)
		end
	end
end)

local name = "Ganymede"
general:AddTextbox("Username","Ganymede",function(value)
	name = value
end)

general:AddButton("Fake Username",function()
	for Index, Value in next, game:GetDescendants() do 
		if Value.ClassName == "TextLabel" then 
			local has = string.find(Value.Text,plr.Character.Humanoid.DisplayName) 
			if has then 
				local str = Value.Text:gsub(plr.Character.Humanoid.DisplayName,name)
				Value.Text = str 
			end
			Value:GetPropertyChangedSignal("Text"):Connect(function()
				local str = Value.Text:gsub(plr.Character.Humanoid.DisplayName,name)
				Value.Text = str 
			end)
		end
	end
	
	game.DescendantAdded:Connect(function(Value)
		if Value.ClassName == "TextLabel" then 
			local has = string.find(Value.Text,plr.Character.Humanoid.DisplayName)
			Value:GetPropertyChangedSignal("Text"):Connect(function()
				local str = Value.Text:gsub(plr.Character.Humanoid.DisplayName,name)
				Value.Text = str 
			end)
			if has then 
				local str = Value.Text:gsub(plr.Character.Humanoid.DisplayName,name)
				Value.Text = str
			end
		end
	end)
end)

general:AddToggle("Nil Character",false,function(value)
	if plr.Character and plr.Character.Humanoid then
		if value then
			plr.Character.Parent = nil
		else
			plr.Character.Parent = workspace
		end
	end
end)

general:AddToggle("Rape Animation",false,function(value)
	if plr.Character and plr.Character.Humanoid then
		if value == true then
			rapeanim = Instance.new("Animation")
			if plr.Character:FindFirstChild("Torso") then
				rapeanim.AnimationId = "rbxassetid://148840371"
				loadedrapeanim = plr.Character.Humanoid:LoadAnimation(rapeanim)
				loadedrapeanim:Play(0,1,5.25)
			elseif plr.Character:FindFirstChild("UpperTorso") then
				rapeanim.AnimationId = "rbxassetid://5918726674"
				loadedrapeanim = plr.Character.Humanoid:LoadAnimation(rapeanim)
				loadedrapeanim:Play(0,1,2.5)
			end
		else
			if loadedrapeanim then
				loadedrapeanim:Stop(0)
			end
			if rapeanim then
				rapeanim:Destroy()
			end
		end
	end
end)



--[[
Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*math.pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = math.exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()

local velSpring = Spring.new(5, Vector3.new())
local panSpring = Spring.new(5, Vector2.new())

local PlayerState = {} do
	local Camera = workspace.CurrentCamera
	local UserInputService = game:GetService("UserInputService")

	mouseBehavior = ""
	mouseIconEnabled = ""
	cameraType = ""
	cameraFocus = ""
	cameraCFrame = ""
	cameraFieldOfView = ""

	function PlayerState.Push()
		cameraFieldOfView = Camera.FieldOfView
		Camera.FieldOfView = 70

		cameraType = Camera.CameraType
		Camera.CameraType = Enum.CameraType.Custom

		cameraCFrame = Camera.CFrame
		cameraFocus = Camera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = true

		mouseBehavior = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end

	function PlayerState.Pop()
		Camera.FieldOfView = 70

		Camera.CameraType = cameraType
		cameraType = nil

		Camera.CFrame = cameraCFrame
		cameraCFrame = nil

		Camera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = mouseBehavior
		mouseBehavior = nil
	end
end

local function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))

	local zoomFactor = math.sqrt(math.tan(math.rad(70/2))/math.tan(math.rad(cameraFov/2)))

	cameraRot = cameraRot + pan*Vector2.new(0.75, 1)*8*(dt/zoomFactor)
	cameraRot = Vector2.new(math.clamp(cameraRot.x, -math.rad(90), math.rad(90)), cameraRot.y%(2*math.pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*Vector3.new(1, 1, 1)*64*dt)
	cameraPos = cameraCFrame.p

	Camera.CFrame = cameraCFrame
	Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	Camera.FieldOfView = cameraFov
end

Input = {} do

	keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
	}

	mouse = {
		Delta = Vector2.new(),
	}

	NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	PAN_MOUSE_SPEED = Vector2.new(1, 1)*(math.pi/64)
	NAV_ADJ_SPEED = 0.75
	NAV_SHIFT_MUL = 0.25

	navSpeed = 1

	function Input.Vel(dt)
		navSpeed = math.clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A,
			keyboard.E - keyboard.Q,
			keyboard.S - keyboard.W
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

		return (kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kMouse
	end

	do
		function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			game:GetService("ContextActionService"):BindActionAtPriority("FreecamKeyboard",Keypress,false,INPUT_PRIORITY,
			Enum.KeyCode.W,
			Enum.KeyCode.A,
			Enum.KeyCode.S,
			Enum.KeyCode.D,
			Enum.KeyCode.E,
			Enum.KeyCode.Q,
			Enum.KeyCode.Up,
			Enum.KeyCode.Down
			)
			game:GetService("ContextActionService"):BindActionAtPriority("FreecamMousePan",MousePan,false,INPUT_PRIORITY,Enum.UserInputType.MouseMovement)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(keyboard)
			Zero(mouse)
			game:GetService("ContextActionService"):UnbindAction("FreecamKeyboard")
			game:GetService("ContextActionService"):UnbindAction("FreecamMousePan")
		end
	end
end

local fcRunning = false
function StartFreecam(pos)
	if fcRunning then
		StopFreecam()
	end
	local cameraCFrame = Camera.CFrame
	if pos then
		cameraCFrame = pos
	end
	cameraRot = Vector2.new()
	cameraPos = cameraCFrame.p
	cameraFov = Camera.FieldOfView

	PlayerState.Push()

	game:GetService("RunService"):BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
	fcRunning = true
end

function StopFreecam()
	if not fcRunning then return end
	Input.StopCapture()
	game:GetService("RunService"):UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
	workspace.Camera.FieldOfView = 70
	fcRunning = false
end

local freecamsec = player:CreateSector("Freecam","right")

local fctoggle = freecamsec:AddToggle("Freecam",false,function(value)
	StopFreecam()
	if val then StartFreecam() end
end)

local fctpplayer = ""
freecamsec:AddTextbox("Player (Case sensitive)","",function(value)
	fctpplayer = value
end)

freecamsec:AddButton("TP Freecam",function()
	if game:GetService("Players"):FindFirstChild(fctpplayer) then
		local tpplr = game:GetService("Players"):FindFirstChild(fctpplayer)
		if tpplr.Character and tpplr.Character:FindFirstChild("HumanoidRootPart") then
			fctoggle:Set(true)
			StartFreecam(tpplr.Character.HumanoidRootPart.CFrame)
		end
	end
end)
]]




local gametab = window:CreateTab("Game")
local server = gametab:CreateSector("Server","left")

server:AddButton("Rejoin Server",function()
	plr:Kick("Rejoining...")
	game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
end)
server:AddButton("Server Hop",function()
	-- credits to charwar
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	local File = pcall(function()
		AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
	end)
	if not File then
		table.insert(AllIDs, actualHour)
		writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
	end
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								delfile("NotSameServers.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end

	function Teleport()
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end

	plr:Kick("Server Hopping...")

	Teleport()
end)

server:AddButton("Copy JobID",function()
	setclipboard(tostring(game.JobId))
end)

server:AddButton("Copy Game ID",function()
	setclipboard(tostring(game.PlaceId))
end)



local optimizationsec = gametab:CreateSector("Optimization","left")
optimizationsec:AddLabel("Unfocused Window")
local capfpsval = true
local fpscapval = 10
local disablerenderval = true
optimizationsec:AddToggle("Cap FPS",true,function(val)
	capfpsval = val
end)
optimizationsec:AddSlider("FPS Cap",1,10,60,false,function(val)
	fpscapval = val
end)
optimizationsec:AddToggle("Disable Rendering",true,function(val)
	disablerenderval = val
end)

delay(0,function()
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")

	local WindowFocusReleasedFunction = function()
		RunService:Set3dRenderingEnabled(not disablerenderval)
		if capfpsval then
			setfpscap(fpscapval)
		end
		return
	end

	local WindowFocusedFunction = function()
		RunService:Set3dRenderingEnabled(true)
		setfpscap(144)
		return
	end

	local Initialize = function()
		UserInputService.WindowFocusReleased:Connect(WindowFocusReleasedFunction)
		UserInputService.WindowFocused:Connect(WindowFocusedFunction)
		return
	end
	Initialize()
end)



local gameteleport = gametab:CreateSector("Teleport","right")

gameteleport:AddLabel("Server Teleport")
local gameIdValue = game.PlaceId
local jobIdValue = game.JobId
gameteleport:AddTextbox("Game ID",tostring(game.PlaceId),function(value)
	gameIdValue = value
end)
gameteleport:AddTextbox("Job ID",tostring(game.JobId),function(value)
	jobIdValue = value
end)
gameteleport:AddButton("Teleport to Server",function()
	local gID = tonumber(gameIdValue) or game.PlaceId
	local jID = jobIdValue or nil
	if jID then
		game:GetService("TeleportService"):TeleportToPlaceInstance(gID,jID)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(gID)
	end
end)



local gamemisc = gametab:CreateSector("Misc","right")
gamemisc:AddButton("Developer Console (F9)",function()
	local _, str = pcall(function()
		return game:HttpGet("https://gist.githubusercontent.com/luatsuki/a1b48e02d5710ebff8fe1ffb1fc5ea38/raw/055143d9238eb6645fbb1f5c4a9a0122ca90c8f4/Console", true)
	end)

	local s, e = loadstring(str)
	if typeof(s) ~= "function" then
		return
	end

	local success, message = pcall(s)
	if (not success) then
		if printconsole then
			printconsole(message)
		elseif printoutput then
			printoutput(message)
		end
	end
end)

gamemisc:AddButton("Dex",function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

gamemisc:AddButton("Remote Spy",function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/Toon-arch/8f5af8403ca5dabad30763ab2b1cf8d0/raw/87d9847dd85850777e691e46d0c52f9020b42ee2/spy"))()
end)

--gameteleport:AddLabel("Server Teleport")



local visuals = window:CreateTab("Visuals")
if game.PlaceId ~= 2809202155 then
	local esp = visuals:CreateSector("ESP","left")

	delay(0,function()
		_G.qexESP_ENABLED = false
		_G.MAXDISTANCE = 10000
		_G.REFRESHTIME = 2
		_G.SHOWHEALTHDECIMALS = false
		_G.COLOREDHEALTHBAR = true
		_G.USERNAMEFONT = Enum.Font.Code
		_G.HEALTHBARTEXTFONT = Enum.Font.Code
		_G.USERNAMETEXTSIZE = 12
		_G.TEXTCOLOR = Color3.fromRGB(90, 0, 255)
		_G.ESPOFFSET = 5
		_G.SHOWHEALTHBAR = true
	end)

	esp:AddToggle("Enabled",false,function(value)
		_G.qexESP_ENABLED = value
	end)

	esp:AddToggle("Show Health",true,function(value)
		_G.SHOWHEALTHBAR = value
	end)

	esp:AddColorpicker("Color",Color3.fromRGB(90, 0, 255),function(value)
		_G.TEXTCOLOR = value
	end)

	esp:AddSlider("Max Distance",10, 10000, 10000,false,function(value)
		_G.MAXDISTANCE = value
	end)

	esp:AddSlider("Text Size",1,12,32,false,function(value)
		_G.USERNAMETEXTSIZE = value
	end)

	esp:AddToggle("Show Health Decimals",false,function(value)
		_G.SHOWHEALTHDECIMALS = value
	end)

	esp:AddToggle("Colored Health Bar",true,function(value)
		_G.COLOREDHEALTHBAR = value
	end)

	esp:AddSlider("Offset",-10,5,10,false,function(value)
		_G.ESPOFFSET = value
	end)

	esp:AddSlider("Update Time",0.1,2,7.5,1,function(value)
		_G.REFRESHTIME = value
	end)

	esp:AddDropdown("Text Font",{"Legacy","Arial","SourceSans","SourceSansLight","Bodoni","Garamond","Cartoon","Code","Arcade","Fantasy","Gotham","AmaticSC","Ubuntu"},"Code",function(value)
		local font = Enum.Font.Code
		if value == "Legacy" then
			font = Enum.Font.Legacy
		elseif value == "Arial" then
			font = Enum.Font.Arial
		elseif value == "SourceSans" then
			font = Enum.Font.SourceSans
		elseif value == "SourceSansLight" then
			font = Enum.Font.SourceSansLight
		elseif value == "Bodoni" then
			font = Enum.Font.Bodoni
		elseif value == "Garamond" then
			font = Enum.Font.Garamond
		elseif value == "Cartoon" then
			font = Enum.Font.Cartoon
		elseif value == "Code" then
			font = Enum.Font.Code
		elseif value == "Arcade" then
			font = Enum.Font.Arcade
		elseif value == "Fantasy" then
			font = Enum.Font.Fantasy
		elseif value == "Gotham" then
			font = Enum.Font.Gotham
		elseif value == "AmaticSC" then
			font = Enum.Font.AmaticSC
		elseif value == "Ubuntu" then
			font = Enum.Font.Ubuntu
		end

		_G.USERNAMEFONT = font
		_G.HEALTHBARTEXTFONT = font
	end)

	delay(0,function()
		local function esp(char)
			pcall(function()
				local plr = game:GetService("Players"):GetPlayerFromCharacter(char)
				if not plr then return end
				if plr == game:GetService("Players").LocalPlayer then return end
		
				if not char:FindFirstChildOfClass("Humanoid") then return end
				local health = char:FindFirstChildOfClass("Humanoid").Health
				local maxhealth = char:FindFirstChildOfClass("Humanoid").MaxHealth
				local torso = char:FindFirstChild("HumanoidRootPart")
				if not torso then return end
		
				if game:GetService("CoreGui"):FindFirstChild(plr.Name.."_HP_DISPLAY_GUI") then
					game:GetService("CoreGui")[plr.Name.."_HP_DISPLAY_GUI"]:Destroy()
				end
				if game:GetService("CoreGui"):FindFirstChild(plr.Name.."_INFO_DISPLAY_GUI") then
					game:GetService("CoreGui")[plr.Name.."_INFO_DISPLAY_GUI"]:Destroy()
				end
		
				if _G.qexESP_ENABLED == false then return end
		
				if _G.SHOWHEALTHBAR == true then
					local bbgui = Instance.new("BillboardGui",game:GetService("CoreGui"))
					if syn then
						syn.protect_gui(bbgui)
					end
					bbgui.Adornee = torso
					bbgui.Name = plr.Name.."_HP_DISPLAY_GUI"
					bbgui.AlwaysOnTop = true
					bbgui.ExtentsOffset = Vector3.new(0,_G.ESPOFFSET,0)
					bbgui.Size = UDim2.new(5,0,1.2,0)
					bbgui.MaxDistance = _G.MAXDISTANCE
					bbgui.ResetOnSpawn = false
					game:GetService("Debris"):AddItem(bbgui,7.75)
			
					local bgframe = Instance.new("Frame",bbgui)
					bgframe.BorderSizePixel = 0
					bgframe.BackgroundColor3 = Color3.fromRGB(80,80,80)
					bgframe.Size = UDim2.new(.9,0,.45,0)
					bgframe.Position = UDim2.new(.05,0,.5,0)
			
					local barframe = Instance.new("Frame",bgframe)
					barframe.BorderSizePixel = 0
					barframe.BackgroundColor3 = Color3.fromRGB(100,255,100)
					barframe.ZIndex = 2
					barframe.Size = UDim2.new(health / maxhealth, 0, 1, 0)
			
					local text = Instance.new("TextLabel",bgframe)
					text.Font = _G.HEALTHBARTEXTFONT
					text.BackgroundTransparency = 1
					text.TextScaled = true
					text.Size = UDim2.new(1,0,1,0)
					text.ZIndex = 3
					text.Text = math.floor(health).." / "..math.floor(maxhealth)
				end
		
				local infobbgui = Instance.new("BillboardGui",game:GetService("CoreGui"))
				if syn then
					syn.protect_gui(infobbgui)
				end
				infobbgui.Adornee = torso
				infobbgui.Name = plr.Name.."_INFO_DISPLAY_GUI"
				infobbgui.AlwaysOnTop = true
				infobbgui.ExtentsOffset = Vector3.new(0,_G.ESPOFFSET+1,0)
				infobbgui.Size = UDim2.new(0,150,0,75)
				infobbgui.ResetOnSpawn = false
				infobbgui.MaxDistance = _G.MAXDISTANCE
				game:GetService("Debris"):AddItem(infobbgui,7.75)
		
				local name = Instance.new("TextLabel",infobbgui)
				name.Font = _G.USERNAMEFONT
				if game:GetService("Players").LocalPlayer:IsFriendsWith(plr.UserId) then
					name.TextColor3 = Color3.fromRGB(0,0,255)
				else
					for _,v in pairs(plr.Backpack:GetChildren()) do
						--name.TextColor3 = _G.TEXTCOLOR
						if v:IsA("Tool") and v:FindFirstChild("KnifeServer") and v:FindFirstChild("IsGun") then -- sheriff
							name.TextColor3 = Color3.fromRGB(250, 104, 0)
						elseif v:IsA("Tool") and v:FindFirstChild("KnifeServer") and not v:FindFirstChild("IsGun") then -- murderer
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("KnifeServer") and plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("IsGun") then -- sheriff
							name.TextColor3 = Color3.fromRGB(250, 104, 0)
						elseif plr.Character:FindFirstChildOfClass("Tool") and plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("KnifeServer") and not plr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("IsGun") then -- murderer
							name.TextColor3 = Color3.fromRGB(255, 0, 0)
						else
							name.TextColor3 = _G.TEXTCOLOR
						end
					end
				end
				name.TextScaled = false
				name.TextSize = _G.USERNAMETEXTSIZE
				name.TextStrokeTransparency = 0
				name.TextStrokeColor3 = Color3.fromRGB(0,0,0)
				name.Size = UDim2.new(.75,0,.25,0)
				name.Position = UDim2.new(.125,0,.25,0)
				name.ZIndex = 3
				name.BackgroundTransparency = 1
		
				name.Text = plr.Name.."\n["..plr.DisplayName.."]"
		
				if _G.SHOWHEALTHBAR == true then
					char:FindFirstChildWhichIsA("Humanoid").Changed:Connect(function()
						if not char:FindFirstChildWhichIsA("Humanoid") then return end
						if not bbgui then return end
						if not barframe then return end
						barframe.Size = UDim2.new(char:FindFirstChildWhichIsA("Humanoid").Health / char:FindFirstChildWhichIsA("Humanoid").MaxHealth, 0, 1, 0)
			
						if _G.SHOWHEALTHDECIMALS then
							text.Text = char:FindFirstChildWhichIsA("Humanoid").Health.." / "..char:FindFirstChildWhichIsA("Humanoid").MaxHealth
						else
							text.Text = math.floor(char:FindFirstChildWhichIsA("Humanoid").Health).." / "..math.floor(char:FindFirstChildWhichIsA("Humanoid").MaxHealth)
						end
			
						if _G.COLOREDHEALTHBAR then
							local healthcolor = Color3.fromRGB(100,255,100)
							if health <= maxhealth * .7 then
								healthcolor = Color3.fromRGB(255, 255, 50)
							end
							if health <= maxhealth * .3 then
								healthcolor = Color3.fromRGB(150, 10, 10)
							end
							barframe.BackgroundColor3 = healthcolor
						else
							barframe.BackgroundColor3 = Color3.fromRGB(100,255,100)
					end
					end)
				end
			end)
		end
		
		while wait(_G.REFRESHTIME) do
			for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
				if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
					if plr ~= game:GetService("Players").LocalPlayer then
						esp(plr.Character)
					end
				end
			end
		end
	end)
end

local lighting = visuals:CreateSector("Lighting","left")

local nofog = false
lighting:AddToggle("No Fog",false,function(value)
	nofog = value
end)

lighting:AddColorpicker("Fog Color",Color3.fromRGB(192,192,192),function(value)
	game:GetService("Lighting").FogColor = value
end)

lighting:AddToggle("Global Shadows",game:GetService("Lighting").GlobalShadows,function(value)
	game:GetService("Lighting").GlobalShadows = value
end)

lighting:AddToggle("Brightness",0,game:GetService("Lighting").Brightness,15,1,function(value)
	game:GetService("Lighting").Brightness = value
end)

lighting:AddColorpicker("Ambient",game:GetService("Lighting").Ambient,function(value)
	game:GetService("Lighting").Ambient = value
end)

lighting:AddColorpicker("Outdoor Ambient",game:GetService("Lighting").OutdoorAmbient,function(value)
	game:GetService("Lighting").OutdoorAmbient = value
end)

lighting:AddSlider("Time",0,game:GetService("Lighting").ClockTime,23.9,1,function(value)
	game:GetService("Lighting").ClockTime = value
end)

lighting:AddSlider("Exposure Compensation",0,game:GetService("Lighting").ExposureCompensation,3,1,function(value)
	game:GetService("Lighting").ExposureCompensation = value
end)

local settings = window:CreateTab("Settings")
local sector = settings:CreateSector("Settings","left")
local reexectoggle = sector:AddToggle("Re-execute on Teleport",true,function(value) end)




----------------------------------------------------------------
----------------------------------------------------------------
-- loops
delay(0,function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if LoopWS then
			if plr.Character then
				if plr.Character:FindFirstChild("Humanoid") then
					plr.Character.Humanoid.WalkSpeed = ws
				end
			end
		end
		if LoopJP then
			if plr.Character then
				if plr.Character:FindFirstChild("Humanoid") then
					plr.Character.Humanoid.JumpPower = jp
				end
			end
		end
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			plr.Character.HumanoidRootPart.Anchored = hrpAnchored
		end
		if LoopGrav then
			workspace.Gravity = gravval
		end
		if isflying then
			pcall(function()
				plr.Character.Humanoid.WalkSpeed = flyspeed
				plr.Character.Humanoid.JumpPower = 70
				workspace.Gravity = 450
			end)
		end
	end)
end)

delay(0,function()
	while wait(.8) do
		if nofog then
			game:GetService("Lighting").FogStart = 9999999
			game:GetService("Lighting").FogEnd = 10000000
		end
		if _G.QexYbaTsResist == true then
			if plr.Character and plr.Character.HumanoidRootPart and plr.Character.UpperTorso and workspace:FindFirstChild("Ticking") then
				for _,v in pairs(plr.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						pcall(function()
                            if v.Anchored == true then
                                v.Anchored = false
                            end
                        end)
					end
				end
			end
		end
		if _G.QexYbaRemoveWeatherFog then
			workspace.IgnoreInstances.Fog.Transparency = 1
		end
		if AntiRealityMarble == true and workspace:FindFirstChild("Reality Marble Wall") then
			for _,v in pairs(workspace:GetChildren()) do
				if v.Name == "Reality Marble Wall" then
					wait()
					v.Transparency = .7
					v.CanCollide = false
					wait()
					for _,x in pairs(v:GetChildren()) do
						if x.Name == "UniverseTexture" then
							x.Transparency = .88
						end
					end
				end
			end
		end
	end
end)

delay(0,function()
	while wait() do
		if antivel and plr.Character then
			for _,v in pairs(plr.Character:GetDescendants()) do
				if v:IsA("BodyVelocity") or v:IsA("BodyGyro") or v:IsA("RocketPropulsion") or v:IsA("BodyThrust") or v:IsA("BodyAngularVelocity") or v:IsA("AngularVelocity") or v:IsA("BodyForce") or v:IsA("VectorForce") or v:IsA("LineForce") then
					v:Destroy()
				end
			end
		end
	end
end)

--[[
delay(0,function()
	while true do
		if AntiVampBurn then
            workspace.Weather.Value = "null"
        end
        wait(1)
	end
end)
]]

----------------------------------------------------------------
-- chatspy
delay(0,function()
	enabled = true
	spyOnMyself = true
	public = false
	publicItalics = false
	privateProperties = {
		Color = Color3.fromRGB(90,0,255); 
		Font = Enum.Font.Code;
		TextSize = 18;
	}
	--////////////////////////////////////////////////////////////////
	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
	local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
	local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance

	local function onChatted(p,msg)
		if _G.chatSpyInstance == instance then
			if p==player and msg:lower():sub(1,6)=="/e chatspy" then
				enabled = not enabled
				wait(0.3)
				privateProperties.Text = "(QEX HUB CHATSPY "..(enabled and "EN" or "DIS").."ABLED)"
				StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
			elseif enabled and (spyOnMyself==true or p~=player) then
				msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
				local hidden = true
				local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
					if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
						hidden = false
					end
				end)
				wait(1)
				conn:Disconnect()
				if hidden and enabled then
					if public then
						saymsg:FireServer((publicItalics and "/me " or '').."(QEX HUB) [".. p.Name .."]: "..msg,"All")
					else
						privateProperties.Text = "(QEX HUB) [".. p.Name .."]: "..msg
						StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
					end
				end
			end
		end
	end

	for _,p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg) onChatted(p,msg) end)
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg) onChatted(p,msg) end)
	end)
	privateProperties.Text = "(QEX CHATSPY "..(enabled and "EN" or "DIS").."ABLED)"
	player:WaitForChild("PlayerGui"):WaitForChild("Chat")
	StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
	wait(3)
	local chatFrame = player.PlayerGui.Chat.Frame
	chatFrame.ChatChannelParentFrame.Visible = true
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)
----------------------------------------------------------------

delay(0,function()
	wait(4.5)

	if game.PlaceId == 2809202155 then
		local oldNamecall;
		oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
			local args = {...};
			if not checkcaller() and getnamecallmethod() == "InvokeServer" and tostring(self) == "Returner" and args[1] == "idklolbrah2de" then
				if key then return key;
				else return "  ___XP DE KEY"; end
			end
			if not checkcaller() and getnamecallmethod() == "Kick" then
				return;
			end
			return oldNamecall(self, ...);
		end);
	end
end)

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Qex Hub",
	Text = "Took "..tostring(roundNumber(os.clock() - starttime, 2)).." seconds to load",
	Duration = 4
})
wait()
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Qex Hub",
	Text = "the greatest hub on Roblox is brought to you by Qexware Technologies",
	Duration = 4
})
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
-- thingys
wait(2.5)

plr.OnTeleport:Connect(function(State)
	if State == Enum.TeleportState.Started then
		if syn and reexectoggle:Get() == true then
			syn.queue_on_teleport("repeat wait() until game:IsLoaded();wait(.5);getgenv().qexkey='"..qexkey.."';loadstring(game:HttpGet(('https://raw.githubusercontent.com/lolitsace/QexHubV2/main/qex.lua'),true))()")
		end
	end
end)

if syn then
	if isfolder("QexHub") then
		if isfile("QexHub/defaultkey.txt") then
			writefile("QexHub/defaultkey.txt",qexkey)
		else
			writefile("QexHub/defaultkey.txt",qexkey)
		end
	else
		makefolder("QexHub")
		wait(.5)
		writefile("QexHub/defaultkey.txt",qexkey)
	end
end
