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
  
  local curQuestionIndex = 0
  local answers = {}
  local textsG = {
    {"Great to have you here. Let's get started with some information about youself.", "tap"},
    {"What is your full name", "field", "name"},
    {"What city do you live in?", "field", "city"},
    {"How many years of experience do you have growing?", "field", "years"},
    {"Tell us a bit about yourself.", "field", "bio"},
    {"What email address would you like to use to sign up?", "field", "email"},
    {"Create a password for your accont", "field", "password"},
    {"Congrats you are all set", "tap", ""}
    --{"", "field", "name"}
  }
  local textsL = {
    {"Great to have you here. Let's get started with some information about youself.", "tap"},
    {"What is your full name", "field", "name"},
    {"What is your address?", "field", "address"},
    {"Do you have a garden already?", "field", "yes/no"},
    {"Tell us a bit about yourself.", "field", "bio"},
    {"What email address would you like to use to sign up?", "field", "email"},
    {"Create a password for your accont", "field", "password"},
    {"Congrats you are all set", "tap", ""}
    --{"", "field", "name"}
  }
  
  local texts
  
  if (event.params.role == "g") then
    texts = textsG
  else
    texts = textsL
  end
  
  local text = display.newText(
    {
    text = "",     
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
  text.y = _H*0.3
  sceneGroup:insert(text)

  local tapToContinueText
  
  local field
  
  local function populateNext()
    
    curQuestionIndex = curQuestionIndex + 1
    
    if (curQuestionIndex <= #texts) then
          
      df:updateText(text, texts[curQuestionIndex][1])
            
      if (texts[curQuestionIndex][2] == "tap") then
        
        tapToContinueText = df:createDisplayText("tap to continue", "paperdaisy-demo", 20, 0.5, 0, _W*0.5, _H*0.5, sceneGroup, false, {0.6, 0.6, 0.6})
        

        if (field) then
          field:removeSelf()
          field = nil
        end
        
      elseif (texts[curQuestionIndex][2] == "field") then
        
        if (tapToContinueText) then
          tapToContinueText:removeSelf()
          tapToContinueText = nil
        end
        
        if (field) then
          field:removeSelf()
          field = nil
        end
        
        field = native.newTextField( 0, 0,_W*0.75, 40 )
        field.font = native.newFont("please_write_me_a_song")
        field.align = "center"
        field.x = _W*0.5
        field.y = _H*0.5
        field.placeholder = texts[curQuestionIndex][3]
        field:setTextColor(0.6, 0.6, 0.6)
        field:resizeFontToFitHeight()
        native.setKeyboardFocus( field )
        sceneGroup:insert(field)

        
      end
    
    else
    
      if (field) then
        field:removeSelf()
        field = nil
      end
      
      if (event.params.role == "g") then
        local testvalue = {answers[1], answers[2], answers[3], answers[4]}
        local tablefill = [[INSERT INTO gardeners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[['); ]]

        db:exec( tablefill )
      else
        local testvalue = {answers[1], answers[2]}
        local tablefill = [[INSERT INTO landowners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[['); ]]

        db:exec( tablefill )
      end
      local path = system.pathForFile("login.txt", system.DocumentsDirectory)
      local f = io.open(path, 'w')
      f:write("in")
      f:close()
      f = nil
      
      
      composer.gotoScene("HomeView", {params={["role"]=event.params.role}})
    
    end
    
    
  end
  
  populateNext()

  local function onTap(e)
    if (e.phase == "ended") then
      if (field) then
        answers[#answers + 1] = field.text
      end
      
      if (e.phase == "ended") then
        
        populateNext()
        
      end
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
