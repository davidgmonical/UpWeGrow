local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 24, 0.5, 0, _W*0.5, 30, sceneGroup, false, {0, 0.3, 0})

--  local line0 = df:createRect(_W, 1, 0, 0, 0, 60, {0, 0.3, 0}, sceneGroup)
  
  local impactText = df:createDisplayText("Your Impact", "Roboto-Black", 30, 0.5, 0, _W*0.5, _H*0.08, sceneGroup, false, {0.2, 0.2, 0.2})
  
  local plantedIcon = df:createDisplayImg("images/sprout-tree-svgrepo-com1.png", 70, 70, 0.5, 0.5, _W*0.5, _H*0.28, sceneGroup)
  local plantedText = df:createDisplayText("50 plants", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.34, sceneGroup, false, {0.6, 0.6, 0.6})
  
  local peopleIcon = df:createDisplayImg("images/happy-man-svgrepo-com1.png", 70, 70, 0.5, 0.5, _W*0.5, _H*0.48, sceneGroup)
  local peopleText = df:createDisplayText("50 people", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.54, sceneGroup, false, {0.6, 0.6, 0.6})

  local gardensIcon = df:createDisplayImg("images/garden-svgrepo-com1.png", 70, 70, 0.5, 0.5, _W*0.5, _H*0.68, sceneGroup)
  local gardensText = df:createDisplayText("10 gardens", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.74, sceneGroup, false, {0.6, 0.6, 0.6})
  
--  local addButton = widget.newButton
--        {
--        onRelease = onLandownerTap,
--        defaultFile = "images/add.png",
--        overFile = "images/add.png",
--        width = 22,
--        height = 22,
    
--    }
--    addButton.x = impactText.x + impactText.width*0.5 + 40
--    addButton.y = impactText.y + 18
--    addButton.anchorX = 0.5
--    addButton.anchorY = 0.5
--    addButton.alpha = 0.9
--    sceneGroup:insert(addButton)

  
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
