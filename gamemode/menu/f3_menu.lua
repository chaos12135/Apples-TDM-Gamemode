-- The F3 Menu

if CLIENT then
function f3_menu_apple(data)
	--local ply = data:ReadEntity()

	local MainMenuF3 = vgui.Create( "DFrame" ) -- The menu
	MainMenuF3:SetSize(500, 300)
	MainMenuF3:SetTitle( "Settings Menu" )
	MainMenuF3:SetDraggable( false )
	MainMenuF3:Center()
	MainMenuF3:MakePopup()
	MainMenuF3.OnClose = function()
		if LocalPlayer().gmod_apple_channel_test ~= nil && LocalPlayer().gmod_apple_channel_test:IsValid() then
			LocalPlayer().gmod_apple_channel_test:Stop()
		end
	end
	
	local MainMenuTabs = vgui.Create( "DPropertySheet", MainMenuF3 ) -- Just a sheet
	MainMenuTabs:SetPos( 5, 30 )
	MainMenuTabs:SetSize( 490, 265 )
	
	local DPanelListF3 = vgui.Create( "DPanelList" )
	DPanelListF3:SetPos( 0, 0 )
	DPanelListF3:SetSize( MainMenuTabs:GetWide(), MainMenuTabs:GetTall() )
	DPanelListF3:SetSpacing( 5 )
	DPanelListF3:EnableHorizontal( false )
	DPanelListF3:EnableVerticalScrollbar( true )
	
	local DPanelListF32 = vgui.Create( "DPanelList" )
	DPanelListF32:SetPos( 0, 0 )
	DPanelListF32:SetSize( MainMenuTabs:GetWide(), MainMenuTabs:GetTall() )
	DPanelListF32:SetSpacing( 5 )
	DPanelListF32:EnableHorizontal( false )
	DPanelListF32:EnableVerticalScrollbar( true )
	
	
	
	
	GameEndingScoreValue = vgui.Create( "DTextEntry", DPanelListF3 )
	GameEndingScoreValue:SetPos( 20, 20 )
	GameEndingScoreValue:SetSize(30, 20)
	GameEndingScoreValue:SetText( 0 )
	GameEndingScoreValue.OnChange = function( self )
	local ReplaceToNumbers = string.gsub(GameEndingScoreValue:GetValue(),"%D", "")
	local ReplaceToNumbers = string.gsub(ReplaceToNumbers,"%W", "")
	-- MsgN(string.len(ReplaceToNumbers))
	if string.len(ReplaceToNumbers) != 0 then
		ReplaceToNumbersONLY = ReplaceToNumbers
	else
		ReplaceToNumbersONLY = "10"
	end
		net.Start( "f3_menu_apple_setting_score" )
			net.WriteString(ReplaceToNumbersONLY)
		net.SendToServer( ply )
	end
	
	GameEndingTimeValue = vgui.Create( "DTextEntry", DPanelListF3 )
	GameEndingTimeValue:SetPos( 20, 60 )
	GameEndingTimeValue:SetSize(30, 20)
	GameEndingTimeValue:SetText( 0 )
	GameEndingTimeValue.OnChange = function( self )
	local ReplaceToNumbers = string.gsub(GameEndingTimeValue:GetValue(),"%D", "")
	local ReplaceToNumbers = string.gsub(ReplaceToNumbers,"%W", "")
	if string.len(ReplaceToNumbers) != 0 then
		ReplaceToNumbersONLY2 = ReplaceToNumbers
	else
		ReplaceToNumbersONLY2 = "5"
	end
		net.Start( "f3_menu_apple_setting_time" )
			net.WriteString(ReplaceToNumbersONLY2)
		net.SendToServer( ply )
	end
	
	local GameEndingScoreValueLabel = vgui.Create("DLabel", DPanelListF3 )
	GameEndingScoreValueLabel:SetPos(2,03)
	GameEndingScoreValueLabel:SetColor( Color( 0, 0, 0, 255 ) )
	GameEndingScoreValueLabel:SetFont( "DebugFixed2" )
	GameEndingScoreValueLabel:SetText("Winning Score (team kills):")
	GameEndingScoreValueLabel:SizeToContents()
	
	local GameEndingTimeValueLabel = vgui.Create("DLabel", DPanelListF3 )
	GameEndingTimeValueLabel:SetPos(2,45)
	GameEndingTimeValueLabel:SetColor( Color( 0, 0, 0, 255 ) )
	GameEndingTimeValueLabel:SetFont( "DebugFixed2" )
	GameEndingTimeValueLabel:SetText("Time Limit (minutes):")
	GameEndingTimeValueLabel:SizeToContents()
	
	local GameIntroSoundValueLabel = vgui.Create("DLabel", DPanelListF3 )
	GameIntroSoundValueLabel:SetPos(2,87)
	GameIntroSoundValueLabel:SetColor( Color( 0, 0, 0, 255 ) )
	GameIntroSoundValueLabel:SetFont( "DebugFixed2" )
	GameIntroSoundValueLabel:SetText("Intro Song:")
	GameIntroSoundValueLabel:SizeToContents()
	
	local GameShowSpawnsValueLabel = vgui.Create("DLabel", DPanelListF3 )
	GameShowSpawnsValueLabel:SetPos(2,130)
	GameShowSpawnsValueLabel:SetColor( Color( 0, 0, 0, 255 ) )
	GameShowSpawnsValueLabel:SetFont( "DebugFixed2" )
	GameShowSpawnsValueLabel:SetText("Show Spawn Points:")
	GameShowSpawnsValueLabel:SizeToContents()
	
	GameIntroSoundValue = vgui.Create( "DTextEntry", DPanelListF3 )
	GameIntroSoundValue:SetPos( 32, 103 )
	GameIntroSoundValue:SetSize(172, 20)
	GameIntroSoundValue:SetText( "http://google.com/test.mp3" )
	GameIntroSoundValue.OnChange = function( self )
		net.Start( "f3_menu_apple_setting_intro_song" )
			net.WriteString(GameIntroSoundValue:GetValue())
		net.SendToServer( ply )
	end
	
	GameIntroSoundTimeValue = vgui.Create( "DTextEntry", DPanelListF3 )
	GameIntroSoundTimeValue:SetPos( 207, 103 )
	GameIntroSoundTimeValue:SetSize(25, 20)
	GameIntroSoundTimeValue:SetText( "30" )
	GameIntroSoundTimeValue.OnChange = function( self )
	local ReplaceToNumbers = string.gsub(GameIntroSoundTimeValue:GetValue(),"%D", "")
	local ReplaceToNumbers = string.gsub(ReplaceToNumbers,"%W", "")
	-- MsgN(string.len(ReplaceToNumbers))
	if string.len(ReplaceToNumbers) != 0 then
		ReplaceToNumbersONLY = ReplaceToNumbers
	else
		ReplaceToNumbersONLY = "10"
	end
		net.Start( "f3_menu_apple_setting_intro_song_time" )
			net.WriteString(ReplaceToNumbers)
		net.SendToServer( ply )
	end
	
	GameShowSpawns = vgui.Create( "DCheckBox", DPanelListF3 )
	GameShowSpawns:SetPos( 12, 145 )
	GameShowSpawns:SetValue( 1 )
	GameShowSpawns.OnChange = function( self )
		if GameShowSpawns:GetChecked() == false then
			net.Start( "f3_menu_apple_setting_show_spawns" )
				net.WriteString(0)
			net.SendToServer( ply )
		elseif GameShowSpawns:GetChecked() == true then
			net.Start( "f3_menu_apple_setting_show_spawns" )
				net.WriteString(1)
			net.SendToServer( ply )
		end
	end
	
	GameIntroSoundValueBox = vgui.Create( "DCheckBox", DPanelListF3 )
	GameIntroSoundValueBox:SetPos( 12, 105 )
	GameIntroSoundValueBox:SetValue( 1 )
	GameIntroSoundValueBox.OnChange = function( self )
		if GameIntroSoundValueBox:GetChecked() == false then
			GameIntroSoundValue:SetDisabled(true)
			GameIntroSoundValue:SetEditable(false)
			GameIntroSoundTimeValue:SetDisabled(true)
			GameIntroSoundTimeValue:SetEditable(false)
			IntroSoundPlay:SetDisabled(true)
			net.Start( "f3_menu_apple_setting_intro" )
				net.WriteString(0)
			net.SendToServer( ply )
		elseif GameIntroSoundValueBox:GetChecked() == true then
			GameIntroSoundValue:SetDisabled(false)
			GameIntroSoundValue:SetEditable(true)
			GameIntroSoundTimeValue:SetDisabled(false)
			GameIntroSoundTimeValue:SetEditable(true)
			IntroSoundPlay:SetDisabled(false)
			net.Start( "f3_menu_apple_setting_intro" )
				net.WriteString(1)
			net.SendToServer( ply )
		end
	end
	
	SettingsMapsOnFile = vgui.Create("DListView",DPanelListF3) -- Shows the team's weapons
	SettingsMapsOnFile:SetPos(262, 15)
	SettingsMapsOnFile:SetSize(175, 105)
	SettingsMapsOnFile:SetMultiSelect(false)
	SettingsMapsOnFile:AddColumn("ID"):SetFixedWidth(20)
	SettingsMapsOnFile:AddColumn("Map Name")
	
	SettingsMapsOnPossible = vgui.Create("DListView",DPanelListF3) -- Shows the team's weapons
	SettingsMapsOnPossible:SetPos(262, 140)
	SettingsMapsOnPossible:SetSize(175, 85)
	SettingsMapsOnPossible:SetMultiSelect(false)
	SettingsMapsOnPossible:AddColumn("ID"):SetFixedWidth(20)
	SettingsMapsOnPossible:AddColumn("Map Name")
	
	IntroSoundPlay = vgui.Create( "DImageButton", DPanelListF3 )
	IntroSoundPlay:SetPos( 237, 103 )
	IntroSoundPlay:SetSize( 20, 20 )
	IntroSoundPlay:SetImage( "icon16/control_play.png" )
	IntroSoundPlay:SetDisabled(false)
	IntroSoundPlay.DoClick = function()
	local url = GameIntroSoundValue:GetValue()
		if LocalPlayer().gmod_apple_channel_test ~= nil && LocalPlayer().gmod_apple_channel_test:IsValid() then
			LocalPlayer().gmod_apple_channel_test:Stop()
		end
	
		sound.PlayURL(url,"",function(ch)
			if ch != nil and ch:IsValid() then
				ch:Play()
				LocalPlayer().gmod_apple_channel_test = ch
			end
		end)
	end
	
	local SettingsMapsOnFileLabel = vgui.Create("DLabel", DPanelListF3 )
	SettingsMapsOnFileLabel:SetPos(267,0)
	SettingsMapsOnFileLabel:SetColor( Color( 0, 0, 0, 255 ) )
	SettingsMapsOnFileLabel:SetFont( "DebugFixed2" )
	SettingsMapsOnFileLabel:SetText("Maps on File:")
	SettingsMapsOnFileLabel:SizeToContents()
	
	local SettingsMapsOnPossibleLabel = vgui.Create("DLabel", DPanelListF3 )
	SettingsMapsOnPossibleLabel:SetPos(267,125)
	SettingsMapsOnPossibleLabel:SetColor( Color( 0, 0, 0, 255 ) )
	SettingsMapsOnPossibleLabel:SetFont( "DebugFixed2" )
	SettingsMapsOnPossibleLabel:SetText("List of all available maps:")
	SettingsMapsOnPossibleLabel:SizeToContents()
	
	SettingsMapsOnPossible.OnRowSelected = function( panel, line )
		if IsValid(SettingsMapsOnPossibleAdd) then
			SettingsMapsOnPossibleAdd:SetDisabled( false )
		end
		WhatMapAreWeAdding = SettingsMapsOnPossible:GetLine(line):GetValue(2)
	end

	SettingsMapsOnFile.OnRowSelected = function( panel, line )
		if IsValid(SettingsMapsOnFileRemove) then
			SettingsMapsOnFileRemove:SetDisabled( false )
		end
		WhatMapAreWeRremove = SettingsMapsOnFile:GetLine(line):GetValue(1)
	end

	SettingsMapsOnFileRemove = vgui.Create( "DButton", DPanelListF3 ) -- Creates a button
	SettingsMapsOnFileRemove:SetPos( 445, 20 )
	SettingsMapsOnFileRemove:SetText( "DEL" )
	SettingsMapsOnFileRemove:SetSize( 28, 99 )
	SettingsMapsOnFileRemove:SetDisabled( true )
	SettingsMapsOnFileRemove.DoClick = function()
		if WhatMapAreWeRremove == nil then return end
		
		if IsValid(SettingsMapsOnFile) == true then
			SettingsMapsOnFile:Clear()
		end
		
		net.Start( "f3_menu_apple_remove_map" )
			net.WriteString(WhatMapAreWeRremove)
		net.SendToServer( ply )
		
		net.Start( "f3_menu_apple_fill_settings_maps_r" )
		net.SendToServer( ply )
		
		if IsValid(SettingsMapsOnFileRemove) then
			SettingsMapsOnFileRemove:SetDisabled( true )
		end
	end
	
	SettingsMapsOnPossibleAdd = vgui.Create( "DButton", DPanelListF3 ) -- Creates a button
	SettingsMapsOnPossibleAdd:SetPos( 445, 145 )
	SettingsMapsOnPossibleAdd:SetText( "ADD" )
	SettingsMapsOnPossibleAdd:SetSize( 28, 80 )
	SettingsMapsOnPossibleAdd:SetDisabled( true )
	SettingsMapsOnPossibleAdd.DoClick = function()
		if WhatMapAreWeAdding == nil then return end
		
		if IsValid(SettingsMapsOnFile) == true then
			SettingsMapsOnFile:Clear()
		end
			
		net.Start( "f3_menu_apple_add_new_map" )
			net.WriteString(WhatMapAreWeAdding)
		net.SendToServer( ply )
						
		net.Start( "f3_menu_apple_fill_settings_maps_r" )
		net.SendToServer( ply )
		
		if IsValid(SettingsMapsOnPossibleAdd) then
			SettingsMapsOnPossibleAdd:SetDisabled( true )
		end
	
	end

	net.Start( "f3_menu_apple_fill_settings" )
	net.SendToServer( ply )
	
	net.Start( "f3_menu_apple_fill_settings_maps" )
	net.SendToServer( ply )
	
	net.Start( "f3_menu_apple_fill_settings_maps_r" )
	net.SendToServer( ply )

	
	MainMenuTabs:AddSheet( "General Settings", DPanelListF3, "icon16/controller.png", 
	false, false, "General team information" )
	MainMenuTabs:AddSheet( "Edit Ranks", DPanelListF32, "icon16/group.png", 
	false, false, "Add, Delete, Edit teams" )
	
end
usermessage.Hook("f3_menu_apple", f3_menu_apple)







local function f3_menu_apple_error(data) -- You don't have permission
	chat.AddText(Color(255,0,0,255), "You do not have permission to view the gamemode's settings menu!")
end
usermessage.Hook("f3_menu_apple_error", f3_menu_apple_error)


local function f3_menu_apple_error_map_exists(data) -- You don't have permission
	Derma_Message("The can not add a map twice!", "ERROR", "OK")
end
usermessage.Hook("f3_menu_apple_error_map_exists", f3_menu_apple_error_map_exists)


local function f3_menu_apple_fill_settings(data)
local Score = data:ReadString()
local Time = data:ReadString()
local Intro = data:ReadString()
local IntroChk = data:ReadString()
local IntroTime = data:ReadString()
local ShowSpawns = data:ReadString()
	if IsValid(GameEndingScoreValue) == true then
		GameEndingScoreValue:SetText(Score)
	end
	if IsValid(GameEndingTimeValue) == true then
		GameEndingTimeValue:SetText(Time)
	end
	if IsValid(GameIntroSoundValue) == true then
		GameIntroSoundValue:SetText(Intro)
	end
	if IsValid(GameIntroSoundValueBox) == true then
		if tonumber(IntroChk) == 1 then
			GameIntroSoundValueBox:SetChecked(true)
			if IsValid(GameIntroSoundValue) == true then
				GameIntroSoundValue:SetDisabled(false)
				GameIntroSoundValue:SetEditable(true)
			end
			if IsValid(GameIntroSoundTimeValue) == true then
				GameIntroSoundTimeValue:SetDisabled(false)
				GameIntroSoundTimeValue:SetEditable(true)
			end
			if IsValid(GameIntroSoundTimeValue) == true then
				IntroSoundPlay:SetDisabled(false)
			end
		elseif tonumber(IntroChk) == 0 then
			GameIntroSoundValueBox:SetChecked(false)
			if IsValid(GameIntroSoundValue) == true then
				GameIntroSoundValue:SetDisabled(true)
				GameIntroSoundValue:SetEditable(false)
			end
			if IsValid(GameIntroSoundTimeValue) == true then
				GameIntroSoundTimeValue:SetDisabled(true)
				GameIntroSoundTimeValue:SetEditable(false)
			end
			if IsValid(GameIntroSoundTimeValue) == true then
				IntroSoundPlay:SetDisabled(true)
			end
		end
	end
	if IsValid(GameIntroSoundTimeValue) == true then
		GameIntroSoundTimeValue:SetText(IntroTime)
	end
	
	if IsValid(GameShowSpawns) == true then
		if tonumber(ShowSpawns) == 1 then
			GameShowSpawns:SetChecked(true)
		elseif tonumber(ShowSpawns) == 0 then
			GameShowSpawns:SetChecked(false)
		end
	end

end
usermessage.Hook("f3_menu_apple_fill_settings", f3_menu_apple_fill_settings)


local function f3_menu_apple_fill_settings_maps(data)
	if IsValid(SettingsMapsOnPossible) == true then
		SettingsMapsOnPossible:AddLine(data:ReadShort(),data:ReadString())
	end
end
usermessage.Hook("f3_menu_apple_fill_settings_maps", f3_menu_apple_fill_settings_maps)


function f3_menu_apple_fill_settings_maps_r(data)
	if IsValid(SettingsMapsOnFile) == true then
	local ID = data:ReadShort()
	local Map = data:ReadString()
		SettingsMapsOnFile:AddLine(ID, Map)
	end
end
usermessage.Hook("f3_menu_apple_fill_settings_maps_r", f3_menu_apple_fill_settings_maps_r)

end

























if SERVER then
local function LaunchF3Menu(ply) -- Opens the actual menu
	umsg.Start( "f3_menu_apple", ply )
		umsg.Entity(ply)
	umsg.End()
end


function f3_menu_apple_fill_settings(ply)
	local SettingInfoScore = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '1';" )
	local SettingInfoTime = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '2';" )
	local SettingInfoIntro = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '3';" )
	local SettingInfoIntroCk = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '4';" )
	local SettingInfoIntroTime = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '5';" )
	local SettingsInfoShowSpawns = sql.QueryValue( "SELECT Value from apple_deathmatch_settings WHERE ID = '6';" )
	if SettingInfoScore == nil || SettingInfoTime == nil then return end
	umsg.Start( "f3_menu_apple_fill_settings", ply )
		umsg.String(SettingInfoScore)
		umsg.String(SettingInfoTime)
		umsg.String(SettingInfoIntro)
		umsg.String(SettingInfoIntroCk)
		umsg.String(SettingInfoIntroTime)
		umsg.String(SettingsInfoShowSpawns)
	umsg.End()
end


net.Receive( "f3_menu_apple_setting_score", function( len, ply )
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = '"..net.ReadString().."' WHERE ID = 1;" )
	if sql.LastError() != nil then
		-- MsgN("f3_menu.lua: "..sql.LastError())
	end
end)


net.Receive( "f3_menu_apple_setting_time", function( len, ply )
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = '"..net.ReadString().."' WHERE ID = 2;" )
	if sql.LastError() != nil then
		-- MsgN("f3_menu.lua: "..sql.LastError())
	end
end)


net.Receive( "f3_menu_apple_fill_settings", function( len, ply )
	f3_menu_apple_fill_settings(ply)
end)


net.Receive( "f3_menu_apple_add_new_map", function( len, ply )
	local WhoAreWe = net.ReadString()
	local IfExists = sql.QueryValue( "SELECT Map FROM apple_deathmatch_maplist WHERE Map = "..(sql.SQLStr(WhoAreWe)).."" )
	if IfExists == nil then
		local GetHighest = 0
		local GetHighest = sql.QueryValue( "SELECT ID FROM apple_deathmatch_maplist ORDER BY ID DESC" )
		if GetHighest == nil then
			sql.Query( "INSERT INTO apple_deathmatch_maplist (`ID`,`Map`) VALUES ('1', "..(sql.SQLStr(WhoAreWe))..")" )
		else
			sql.Query( "INSERT INTO apple_deathmatch_maplist (`ID`,`Map`) VALUES ('"..(GetHighest+1).."', "..(sql.SQLStr(WhoAreWe))..")" )
		end
		if sql.LastError() != nil then
			-- MsgN("f3_menu.lua: "..sql.LastError())
		end
	else
		umsg.Start( "f3_menu_apple_error_map_exists", ply )
		umsg.End()	
	end
end)


net.Receive( "f3_menu_apple_fill_settings_maps_r", function( len, ply )
local WhatAreOurMaps = sql.Query( "SELECT * FROM apple_deathmatch_maplist ORDER BY ID ASC" )
if WhatAreOurMaps == nil then return end
	for k, v in pairs(WhatAreOurMaps) do
		umsg.Start( "f3_menu_apple_fill_settings_maps_r", ply )
			umsg.Short(v['ID'])
			umsg.String(v['Map'])
		umsg.End()
	end
end)


net.Receive( "f3_menu_apple_setting_intro", function( len, ply )
	local SongID = net.ReadString()
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = '"..SongID.."' WHERE ID = '4' " )
end)


net.Receive( "f3_menu_apple_setting_show_spawns", function( len, ply )
	local ShowSpawns = net.ReadString()
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = '"..ShowSpawns.."' WHERE ID = '6' " )
	ReCreateSpawnItems()
end)


net.Receive( "f3_menu_apple_setting_intro_song_time", function( len, ply )
	local SongIDTime = net.ReadString()
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = '"..SongIDTime.."' WHERE ID = '5' " )
end)


net.Receive( "f3_menu_apple_setting_intro_song", function( len, ply )
	local SongName = net.ReadString()
	sql.Query( "UPDATE apple_deathmatch_settings SET Value = "..sql.SQLStr(SongName).." WHERE ID = '3' " )
end)


net.Receive( "f3_menu_apple_remove_map", function( len, ply )
	local ID = net.ReadString()
	sql.Query( "DELETE FROM apple_deathmatch_maplist WHERE ID = '"..ID.."'" )
	local FixOrderForMaps = sql.Query( "SELECT * FROM apple_deathmatch_maplist ORDER BY ID ASC" )
	if FixOrderForMaps == nil then return end
	for k, v in pairs(FixOrderForMaps) do
		sql.Query( "UPDATE apple_deathmatch_maplist SET ID = '"..k.."' WHERE ID = '"..v['ID'].."' " )
	end
end)


net.Receive( "f3_menu_apple_fill_settings_maps", function( len, ply )
local maps = file.Find( "maps/*.bsp", "GAME" ) -- Thanks ULX
for l, map in ipairs( maps ) do
	umsg.Start( "f3_menu_apple_fill_settings_maps", ply )
		umsg.Short(l)
		umsg.String(map:sub( 1, -5 ):lower())
	umsg.End()
end
end)



function GM:ShowSpare1( ply ) -- Launched the F3 Menu
	if ULib != nil then
		if ULib.ucl.query( ply, "apple gamemode settings" ) == true then
			LaunchF3Menu(ply)	
		elseif ULib.ucl.query( ply, "apple gamemode settings" ) == false then
			umsg.Start( "f3_menu_apple_error", ply )
			umsg.End()	
		end
	elseif ply:IsSuperAdmin() == true then
		LaunchF3Menu(ply)
	else
		umsg.Start( "f3_menu_apple_error", ply )
		umsg.End()	
	end
end
util.AddNetworkString( "f3_menu_apple_fill_settings_maps" )
util.AddNetworkString( "f3_menu_apple_fill_settings" )
util.AddNetworkString( "f3_menu_apple_setting_time" )
util.AddNetworkString( "f3_menu_apple_setting_score" )
util.AddNetworkString( "f3_menu_apple_fill_settings_maps_r" )
util.AddNetworkString( "f3_menu_apple_setting_intro" )
util.AddNetworkString( "f3_menu_apple_setting_intro_song_time" )
util.AddNetworkString( "f3_menu_apple_setting_show_spawns" )
util.AddNetworkString( "f3_menu_apple_setting_intro_song" )
util.AddNetworkString( "f3_menu_apple_remove_map" )
util.AddNetworkString( "f3_menu_apple_add_new_map" )
end