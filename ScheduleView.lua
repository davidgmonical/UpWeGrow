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
  
  local logo = df:createDisplayText("GardenShare", "Gardena", 30, 0.5, 0, _W*0.5, 36, sceneGroup, false, {0, 0.3, 0})

  local line0 = df:createRect(_W, 1, 0, 0, 0, 74, {0, 0.3, 0}, sceneGroup)
  
  for i = 8, 16 do
    local hour = i%12
    if (i == 0) then i =12; hour = 12 end
    local hour = df:createDisplayText(hour, "paperdaisy-demo", 16, 0.5, 0, 10, 210+(i-8)*45, sceneGroup, false, {0.5, 0.5, 0.5})
  end
    
  -- Create the widget
  local scrollView = widget.newScrollView(
      {
          top = 100,
          left = 20,
          width = _W*0.9,
          height = _H*0.75,
          scrollWidth = 10000,
          scrollHeight = _H*0.5,
          verticalScrollDisabled = true,
          listener = scrollListener
      }
  )
  sceneGroup:insert(scrollView)
  
  local days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}
  local date = os.date( "*t" )
  local time = os.time()
  
  for i = 1, 100 do
    
    local verticalLine = df:createRect(1, _H, 0, 0, i*100, 100, {0, 0.3, 0}, scrollView)
    
    local dayText = df:createDisplayText(days[date.wday], "paperdaisy-demo", 30, 0.5, 0, i*100 - 50, 36, scrollView, false, {0.5, 0.5, 0.5})
    local dateText = df:createDisplayText(date.day, "paperdaisy-demo", 24, 0.5, 0, i*100 - 50, 60, scrollView, false, {0.5, 0.5, 0.5})
    
    time = time + 60*60*24
    date = os.date( "*t" , time)
    
    
  end
  
  
  
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
