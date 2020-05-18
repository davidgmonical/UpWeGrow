-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


display.setStatusBar(display.HiddenStatusBar)

_W = display.contentWidth
_H = display.contentHeight

data = require("Data")


local composer = require( "composer" )

local signedIn = io.open(system.pathForFile("userId.txt", system.DocumentsDirectory), 'r')
if (signedIn) then
  composer.gotoScene("HomeView", {params = {["role"] = "g"}})
else
  composer.gotoScene("ChooseRoleView")
end
