local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

local onGardenerTap
local onLandownerTap

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})
  
--  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)
  
  
  local text = display.newText(
    {
    text = "We look forward to having YOU on our team! As an organization centred around using the land, it is important to keep in mind the land that we live and work on. We acknowledge that as a Waterloo based organization, we are on the traditional territory of the Haudenosaunne, Annishnawbe and Neutral/Attawandaron (Neutral) peoples. We intend to keep in mind this heavy burden of working on stolen land and aim to incorporate the voices of local indegenous people(s) whenever possible, by creating events in which they can come together and teach volunteers their ways of gardening, harvesting, and being in harmony with the land.",     
    x = 0,
    y = 0,
    width = _W*0.8,
    font = "Roboto-Thin",   
    fontSize = 18,
    align = "center"  -- Alignment parameter
  })
  text:setFillColor(0.4, 0.4, 0.4)
  text.anchorX = 0.5
  text.anchorY = 0.5
  text.x = _W*0.5
  text.y = _H*0.4
  sceneGroup:insert(text)

  local tapToContinueText = df:createDisplayText("tap to acknowledge", "Roboto", 20, 0.5, 0, _W*0.5, _H*0.85, sceneGroup, false, {0.6, 0.6, 0.6})

  local function onTap(e)
    if (e.phase == "ended") then
      composer.gotoScene("SignUpView", {params={["role"]=event.params.role}})
      Runtime:removeEventListener("touch", onTap)
    end
  end

  Runtime:addEventListener("touch", onTap)
  
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
