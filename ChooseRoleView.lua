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
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
  local logo = df:createDisplayText("GardenShare", "Gardena", 50, 0.5, 0, _W*0.5, 56, sceneGroup, false, {0, 0.3, 0})
  
  --local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)

  
--  local text = df:createDisplayText("Which are you", "paperdaisy-demo", 30, 0.5, 0, _W*0.5, _H*0.48, sceneGroup, false, {0.6, 0.6, 0.6})

  
  onGardenerTap = function(e)
    composer.gotoScene("SignUpView", {params={["role"]="g"}})
    
  end
    
  onLandownerTap = function(e)
      
    composer.gotoScene("SignUpView", {params={["role"]="l"}})
      
  end
  
--  gardenerButton = widget.newButton
--    {
--        onRelease = onGardenerTap,
--        defaultFile = "images/gardener.png",
--        overFile = "images/gardener.png",
--        width = _W,
--        height = _H*0.44,
--        label = "Gardener",
--        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
--        font = "HelveticaBold",
--        fontSize = 40
--    }
--    gardenerButton.x = 0
--    gardenerButton.y = 0
--    gardenerButton.anchorX = 0
--    gardenerButton.anchorY = 0
--    sceneGroup:insert(gardenerButton)
    
----    local line = df:createRect(_W, 5, 0, 0, 0, gardenerButton.y + gardenerButton.height, {1, 1, 1}, sceneGroup)
    
--    landownerButton = widget.newButton
--    {
--        onRelease = onLandownerTap,
--        defaultFile = "images/garden.jpg",
--        overFile = "images/garden.jpg",
--        width = _W,
--        height = _H*0.44,
--        label = "Land owner",
--        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
--        font = "HelveticaBold",
--        fontSize = 40
--    }
--    landownerButton.x = 0
--    landownerButton.y = _H*0.56
--    landownerButton.anchorX = 0
--    landownerButton.anchorY = 0
--    sceneGroup:insert(landownerButton)

    local text = display.newText(
      {
      text = "Join to help out your commmunity and the food system all at once",     
      x = 0,
      y = 0,
      width = _W*0.75,
      font = "paperdaisy-demo",   
      fontSize = 30,
      align = "center"  -- Alignment parameter
    })
    text:setFillColor(0.6, 0.6, 0.6)
    text.anchorX = 0.5
    text.anchorY = 0.5
    text.x = _W*0.5
    text.y = _H*0.4
    sceneGroup:insert(text)
    
    gardenerButton = widget.newButton
    {
        onRelease = onGardenerTap,
        shape = "roundedRect",
        width = 200,
        height = 50,
        cornerRadius = 10,
        fillColor = { default={0.2, 0.4, 0.2}, over={0.2, 0.4, 0.2, 0.5} },
        strokeColor = { default={0.5, 0.8, 0.5}, over={0.5, 0.8, 0.5, 0.5} },
        strokeWidth = 4,
        label = "For gardeners",
        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
        font = "paperdaisy-demo",
        fontSize = 32
    }
    gardenerButton.x = _W*0.5
    gardenerButton.y = _H*0.7
    gardenerButton.anchorX = 0.5
    gardenerButton.anchorY = 0.5
    sceneGroup:insert(gardenerButton)
    
    landscapeButton = widget.newButton
    {
        onRelease = onLandownerTap,
        shape = "roundedRect",
        width = 200,
        height = 50,
        cornerRadius = 10,
        fillColor = { default={0.2, 0.4, 0.2}, over={0.2, 0.4, 0.2, 0.5} },
        strokeColor = { default={0.5, 0.8, 0.5}, over={0.5, 0.8, 0.5, 0.5} },
        strokeWidth = 4,
        label = "For landowners",
        labelColor = { default={1, 1, 1}, over={ 0, 0, 0, 0.5 } },
        font = "paperdaisy-demo",
        fontSize = 32
    }
    landscapeButton.x = _W*0.5
    landscapeButton.y = _H*0.8
    landscapeButton.anchorX = 0.5
    landscapeButton.anchorY = 0.5
    sceneGroup:insert(landscapeButton)
    
  
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
