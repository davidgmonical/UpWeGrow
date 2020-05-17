local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

local gardenerButton
local landownerButton
local onGardenerTap
local onLandownerTap

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {0.1, 0.1, 0.1}, sceneGroup)
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})
  
--  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)

  
  local text = df:createDisplayText("Which are you", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.48, sceneGroup, false, {0.6, 0.6, 0.6})

  
  onGardenerTap = function(e)
    composer.gotoScene("SignUpView")
    
  end
    
  onLandownerTap = function(e)
      
    composer.gotoScene("SignUpView")
      
  end
  
  gardenerButton = widget.newButton
    {
        onRelease = onGardenerTap,
        defaultFile = "images/gardener.png",
        overFile = "images/gardener.png",
        width = _W,
        height = _H*0.44,
        label = "Gardener",
        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
        font = "HelveticaBold",
        fontSize = 40
    }
    gardenerButton.x = 0
    gardenerButton.y = 0
    gardenerButton.anchorX = 0
    gardenerButton.anchorY = 0
    sceneGroup:insert(gardenerButton)
    
--    local line = df:createRect(_W, 5, 0, 0, 0, gardenerButton.y + gardenerButton.height, {1, 1, 1}, sceneGroup)
    
    landownerButton = widget.newButton
    {
        onRelease = onGardenerTap,
        defaultFile = "images/garden.jpg",
        overFile = "images/garden.jpg",
        width = _W,
        height = _H*0.44,
        label = "Land owner",
        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
        font = "HelveticaBold",
        fontSize = 40
    }
    landownerButton.x = 0
    landownerButton.y = _H*0.56
    landownerButton.anchorX = 0
    landownerButton.anchorY = 0
    sceneGroup:insert(landownerButton)
    
    
    
  
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
