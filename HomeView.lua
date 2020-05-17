local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})

  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)
    
    local function onTabBarTap(e)
    
    end
    
    local tabButtons = {}
    local tabBarImages = {"images/user.png", "images/planet-earth.png", "images/calendar.png"}
    local tabBarOverImages = tabBarImages
    local labels = {"Profile", "Impact", "Schedule"}
    
    local function onTabBarTap(e)
      
      if (e.target.id == 1) then
        composer.gotoScene("HomeView")
      elseif (e.target.id == 2) then
        composer.gotoScene("ImpactView")
      elseif (e.target.id == 3) then
        composer.gotoScene("ScheduleView")
      end
      
    end
    
    for i = 1, 3 do
        
        local tabButton = {
            width = 25,
            height = 25,
            labelColor = { default={0.6, 0.6, 0.6}, over={0.6, 0.6, 0.6} },
            defaultFile = tabBarImages[i],
            overFile = tabBarOverImages[i],
            label = labels[i],
            font = "HelveticaLight",
            size = 8,
            id = i,
            selected = (i<2),
            onPress = onTabBarTap
        }
        tabButtons[#tabButtons + 1] = tabButton
    end
    
    local tabBar = widget.newTabBar(
        {
            top = _H - 40,
            width = _W,
            height = 40,
            buttons = tabButtons
        }
    )
    
    
    local profileShot = display.newCircle(_W*0.5, _H*0.28, 80)
    profileShot.fill = {
        type = "image",
        filename = "images/testGardener.jpg"
    }
    sceneGroup:insert(profileShot)
    print(event.params["answers"][1])
    
    local name = df:createDisplayText(event.params["answers"][1], "paperdaisy-demo", 34, 0.5, 0, _W*0.5, profileShot.y + profileShot.height*0.5 + 14, sceneGroup, false, {0.6, 0.6, 0.6})
    
    local loc = df:createDisplayText(event.params["answers"][2], "paperdaisy-demo", 28, 0.5, 0, _W*0.5, name.y + name.height, sceneGroup, false, {0.6, 0.6, 0.6})
    
    local exp = df:createDisplayText("Years of experience \n "..event.params["answers"][3], "paperdaisy-demo", 28, 0, 0, _W*0.1, loc.y + loc.height + 20, sceneGroup, false, {0.6, 0.6, 0.6})
    
    local bio = df:createDisplayText("Bio \n "..event.params["answers"][4], "paperdaisy-demo", 28, 0, 0, _W*0.1, exp.y + exp.height + 40, sceneGroup, false, {0.6, 0.6, 0.6})
  
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
