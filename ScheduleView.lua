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
  
--  local logo = df:createDisplayText("GardenShare", "Gardena", 24, 0.5, 0, _W*0.5, 30, sceneGroup, false, {0, 0.3, 0})

--  local line0 = df:createRect(_W, 1, 0, 0, 0, 60, {0, 0.3, 0}, sceneGroup)
  
  local scheduleText = df:createDisplayText("Calendar", "Roboto-Black", 30, 0.5, 0, _W*0.5, _H*0.08, sceneGroup, false, {0.2, 0.2, 0.2})

  
  for i = 8, 16 do
    local hour = i%12
    if (hour == 0) then i =12; hour = 12; end
    local hour = df:createDisplayText(hour, "paperdaisy-demo", 16, 0.5, 0, 10, 210+(i-8)*45, sceneGroup, false, {0.4, 0.4, 0.4})
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
  
  local slotData = {}
  
  for _,row in pairs(data:getTimeSlots()) do
    local date = row.date
    local timestart = row.timestart
    local timeend = row.timeend
    local _, _, m, d, y = string.find(date, "(%d+)/(%d+)/(%d+)")
    slotData[tostring(d)] = {d, row.timestart, row.timeend, row.id}
  end
  
  local days = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}
  local date = os.date( "*t" )
  local time = os.time()
  
  for i = 1, 100 do
    
    local verticalLine = df:createRect(1, _H, 0, 0, i*100, 90, {0, 0.3, 0}, scrollView)
    
    local dayText = df:createDisplayText(days[date.wday], "paperdaisy-demo", 30, 0.5, 0, i*100 - 50, 30, scrollView, false, {0.4, 0.4, 0.4})
    local dateText = df:createDisplayText(date.day, "paperdaisy-demo", 24, 0.5, 0, i*100 - 50, 60, scrollView, false, {0.4, 0.4, 0.4})
    if (slotData[tostring(date.day)]) then
      local box = df:createRect(98, 135, 0.5, 0, i*100 - 50, (slotData[tostring(date.day)][2]-8)*45 + 110, {0.95, 0.95, 0.95}, scrollView)
      box.id = slotData[tostring(date.day)][4]
      
      
      local text = df:createDisplayText("Open!", "paperdaisy-demo", 32, 0.5, 0.5, box.x, box.y + box.height*0.5, scrollView, false, {0.5, 0.5, 0.5})
      local text2 = df:createDisplayText("tap to sign up", "paperdaisy-demo", 20, 0.5, 0.5, box.x, box.y + box.height*0.5 + 25, scrollView, false, {0.5, 0.5, 0.5})
      
      local function onBoxTap(e)
        if (text.text == "Open!") then
          box:setFillColor(0.8, 0.9, 0.8)
          text.text = "Signed up!"
          text2.text = "thank you"
          data:signUpForSlot(box.id)
        else
          box:setFillColor(0.95, 0.95, 0.95)
          text.text = "Open!"
          text2.text = "tap to sign up"
          data:abandonSlot(box.id)
        end
        
      end
      
      box:addEventListener("tap", onBoxTap)
      
    end
    
    
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
