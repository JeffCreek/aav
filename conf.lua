
local L = LibStub("AceLocale-3.0"):GetLocale("atroxArenaViewer", true)

-- Slash commands
SLASH_ATROXARENAVIEWER1 = "/aav"
SLASH_ATROXARENAVIEWER2 = "/AAV"
SlashCmdList["ATROXARENAVIEWER"] = function(msg)
	msg = string.lower(msg or "")
	
	local self = _G["atroxArenaViewer"]
	
	print("> /aav " .. msg)
	
	if (msg == "broadcast") then
		self:changeBroadcast()
		
	elseif (msg == "lookup") then
		atroxArenaViewer:lookup()
		
	elseif (string.find(msg, 'connect%s%d*')) then
		local name = string.sub(msg, 9)
		atroxArenaViewer:connectToBroadcast(name)
			
	elseif (msg == "spectators") then
		print("|cffe392c5<AAV>|r current spectators (total: " .. #atroxArenaViewer:getSpectators() .. ")")
		if (#atroxArenaViewer:getSpectators() > 0) then
			for k,v in pairs(atroxArenaViewer:getSpectators()) do
				print("- " .. v)
			end
		end
		
	elseif (msg == "record") then
		self:changeRecording()
		
	elseif (msg == "delete all") then
		local numOfMatches = #atroxArenaViewerData.data
		for i = 1, numOfMatches do
			atroxArenaViewer:deleteMatch(1)
		end
		AAV_TableGui:RefreshFrameIfShowing()
		
	elseif(msg == "ui") then
		if(AAV_TableGui:isMatchesFrameShowing()) then
			AAV_TableGui:hideMatchesFrame()
		else
			AAV_TableGui:showMatchesFrame()
		end
		
	else 	
		print(L.CONF_HELP_LINE1)
		print(L.CONF_HELP_LINE2)
		print(L.CONF_HELP_LINE3)
		print(L.CONF_HELP_LINE4)
		print(L.CONF_HELP_LINE5)
		print(L.CONF_HELP_LINE6)
		print(L.CONF_HELP_LINE7)
		print(L.CONF_HELP_LINE8)		
	end
	
end