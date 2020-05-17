local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})
  
  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)
  
  local plantedText = df:createDisplayText("You've planted", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.25, sceneGroup, false, {0.6, 0.6, 0.6})
  
  local peopleText = df:createDisplayText("People you've helped", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.45, sceneGroup, false, {0.6, 0.6, 0.6})

  local gardensText = df:createDisplayText("Gardens you've worked at", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.65, sceneGroup, false, {0.6, 0.6, 0.6})

  
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
