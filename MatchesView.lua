local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
  local logo = df:createDisplayText("GardenShare", "Gardena", 24, 0.5, 0, _W*0.5, 30, sceneGroup, false, {0, 0.3, 0})

  local line0 = df:createRect(_W, 1, 0, 0, 0, 60, {0, 0.3, 0}, sceneGroup)
    
  local matches = df:createDisplayImg("images/matches.png", _W, _H-80, 0.5, 0.5, _W*0.5, _H*0.5-50, sceneGroup)
  
end

function scene:show(event)


  
end

function scene:hide(event)
 
    local sceneGroup = self.view
    local phase = event.phase
    
 
    if ( phase == "will" ) then
       
    elseif ( phase == "did" ) then

    end
end 
 
function scene:destroy(event)
 
    local sceneGroup = self.view
 
end
  
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
 
return scene
