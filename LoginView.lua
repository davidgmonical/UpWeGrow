local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

local onGardenerTap
local onLandownerTap
local done

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})
  
--  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)
  
  
  local usernameField = native.newTextField( 0, 0,_W*0.75, 40 )
  usernameField.font = native.newFont("please_write_me_a_song")
  usernameField.align = "center"
  usernameField.x = _W*0.5
  usernameField.y = _H*0.2
  usernameField.placeholder = "username"
  usernameField:setTextColor(0.6, 0.6, 0.6)
  usernameField:resizeFontToFitHeight()
  native.setKeyboardFocus( usernameField )
  sceneGroup:insert(usernameField)
  
  local passwordField = native.newTextField( 0, 0,_W*0.75, 40 )
  passwordField.font = native.newFont("please_write_me_a_song")
  passwordField.align = "center"
  passwordField.x = _W*0.5
  passwordField.y = _H*0.3
  passwordField.placeholder = "password"
  passwordField:setTextColor(0.6, 0.6, 0.6)
  passwordField:resizeFontToFitHeight()
  native.setKeyboardFocus( passwordField )
  sceneGroup:insert(passwordField)
  
  local function onNext()
    
    ROLE = data:login(usernameField.text, passwordField.text)
    print(ROLE)
    
  end
  
  local nextButton = widget.newButton
        {
        onRelease = onNext,
        defaultFile = "images/add.png",
        overFile = "images/add.png",
        width = 30,
        height = 30,
    
    }
    nextButton.x = _W*0.5
    nextButton.y = passwordField.y + 60
    nextButton.anchorX = 0.5
    nextButton.anchorY = 0.5
    nextButton.alpha = 0.9
    sceneGroup:insert(nextButton)
      

      
  
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
