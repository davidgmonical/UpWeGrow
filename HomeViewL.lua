local composer = require( "composer" )
local df = require("DisplayFunctions")
local widget = require("widget")

local scene = composer.newScene()

function scene:create(event)
  
  local sceneGroup = self.view
  print("CREATE")
  local bg = df:createRect(_W, _H, 0, 0, 0, 0, {1, 1, 1}, sceneGroup)
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 24, 0.5, 0, _W*0.5, 30, sceneGroup, false, {0, 0.3, 0})

--  local line0 = df:createRect(_W, 1, 0, 0, 0, 60, {0, 0.3, 0}, sceneGroup)
  
  local rect = df:createRect(_W, 175, 0, 0, 0, 0, {0.365, 0.69, 0.541}, sceneGroup)
    
    local function onTabBarTap(e)
    
    end
    
    local tabButtons = {}
    local tabBarImages = {"images/avatar.png", "images/signs.png", "images/calendar.png", "images/connection.png"}
    local tabBarOverImages = tabBarImages
    local labels = {"PROFILE", "IMPACT", "SCHEDULE", "MATCHES"}
    
    local function onTabBarTap(e)
      
      if (e.target.id == 1) then
        composer.gotoScene("HomeView")
      elseif (e.target.id == 2) then
        composer.gotoScene("ImpactView")
      elseif (e.target.id == 3) then
        composer.gotoScene("ScheduleView")
      elseif (e.target.id == 4) then
        composer.gotoScene("MatchesView")
      end
      
    end
    
    for i = 1, 4 do
        
        local tabButton = {
            width = 26,
            height = 30,
            labelColor = { default={1, 1, 1}, over={0.1, 0.1, 0.1} },
            defaultFile = tabBarImages[i],
            overFile = tabBarOverImages[i],
            label = labels[i],
            font = "Helvetica",
            size = 10,
            id = i,
            selected = (i<2),
            onPress = onTabBarTap
        }
        tabButtons[#tabButtons + 1] = tabButton
    end
    
    local tabBar = widget.newTabBar(
        {
            top = _H - 55,
            width = _W,
            height = 55,
            backgroundFile = "images/tabBarBack.png",
            tabSelectedLeftFile = "images/tabBarBack.png",
            tabSelectedRightFile = "images/tabBarBack.png",
            tabSelectedMiddleFile = "images/tabBarBack.png",
            tabSelectedFrameWidth = 40,
        tabSelectedFrameHeight = 120,
            buttons = tabButtons
        }
    )
    
    
    
    local profileShot = display.newCircle(_W*0.5, _H*0.25, 80)
    profileShot.fill = {
        type = "image",
        filename = "images/testGardener.jpg"
    }
    sceneGroup:insert(profileShot)
    profileShot:setStrokeColor(1, 1, 1)
    profileShot.strokeWidth = 3
    
    local answers = {}
    if (event.params.role == "g") then
      row = data:getGardener()
      answers = {row.name, row.location, row.years, row.bio}
    else
      row = data:getLandowner()
      answers = {row.name, row.location}
    end
    
    local name = df:createDisplayText(answers[1], "sweetpurple", 34, 0.5, 0, _W*0.5, profileShot.y + profileShot.height*0.5, sceneGroup, false, {0.2, 0.2, 0.2})
    
    local loc = df:createDisplayText(answers[2], "paperdaisy-demo", 28, 0.5, 0, _W*0.5, name.y + name.height, sceneGroup, false, {0.6, 0.6, 0.6})
    
    local expT = df:createDisplayText("Years of experience", "Roboto-Black", 14, 0, 0, _W*0.1, loc.y + loc.height + 40, sceneGroup, false, {0.2, 0.2, 0.2})
    
    local exp = df:createDisplayText(answers[3], "paperdaisy-demo", 28, 0, 0, _W*0.1, expT.y + expT.height + 5, sceneGroup, false, {0.6, 0.6, 0.6})
    
    local bioT = df:createDisplayText("Personal bio", "Roboto-Black", 14, 0, 0, _W*0.1, exp.y + exp.height + 20, sceneGroup, false, {0.2, 0.2, 0.2})
    
    local bio = df:createDisplayText(answers[4], "paperdaisy-demo", 28, 0, 0, _W*0.1, bioT.y + bioT.height + 5, sceneGroup, false, {0.6, 0.6, 0.6})
  
    local editT = df:createDisplayText("edit", "paperdaisy-demo", 24, 0, 0, _W*0.5, bio.y + bio.height + 60, sceneGroup, false, {0.7, 0.7, 0.7})
  
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
