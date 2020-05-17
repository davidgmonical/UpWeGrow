-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


display.setStatusBar(display.HiddenStatusBar)

_W = display.contentWidth
_H = display.contentHeight

local sqlite3 = require( "sqlite3" )
 
-- Open "data.db". If the file doesn't exist, it will be created
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local exists = io.open(path,'r')
db = sqlite3.open( path )  

-- Handle the "applicationExit" event to close the database
  local function onSystemEvent( event )
      if ( event.type == "applicationExit" ) then             
          db:close()
      end
  end
  
if (not(exists)) then
  
    
  -- Set up the table if it doesn't exist
  local tablesetup = [[CREATE TABLE IF NOT EXISTS gardeners (id INTEGER PRIMARY KEY, name, location, years, bio);]]
  db:exec( tablesetup )

  tablesetup = [[CREATE TABLE IF NOT EXISTS landowners (id INTEGER PRIMARY KEY, name, location);]]
  db:exec( tablesetup )
  
  tablesetup = [[CREATE TABLE IF NOT EXISTS timeslots (id INTEGER PRIMARY KEY, date, timestart, timeend, gardener, landowner);]]
  db:exec( tablesetup )

--  -- Add rows with an auto index in 'id'. You don't need to specify a set of values because we're populating all of them.
--  local testvalue = {"Howard Roman", "Waterloo", "10", "I love plants"}
--  local tablefill = [[INSERT INTO gardeners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[['); ]]

--  db:exec( tablefill )
  
--  testvalue = {"Shirley Gardener", "550 King St North, Conestoga Mall, Waterloo, ON N2L 5W6, Canada"}
--  tablefill = [[INSERT INTO landowners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[['); ]]

--  db:exec( tablefill )
    
  testvalue = {"5/18/20", "9", "12", "NULL", "NULL"}
  tablefill = [[INSERT INTO timeslots VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[[',']]..testvalue[5]..[['); ]]

  db:exec( tablefill )  
  
  
  testvalue = {"5/17/20", "12", "3", "NULL", "NULL"}
  tablefill = [[INSERT INTO timeslots VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[[',']]..testvalue[5]..[['); ]]

  db:exec( tablefill )  
  
  -- Print the SQLite version
  print( "SQLite version " .. sqlite3.version() )
end

 
-- Setup the event listener to catch "applicationExit"
Runtime:addEventListener( "system", onSystemEvent )

local composer = require( "composer" )

local signedIn = io.open(system.pathForFile("login.txt", system.DocumentsDirectory), 'r')
if (signedIn) then
  composer.gotoScene("HomeView", {params = {["role"] = "g"}})
else
  composer.gotoScene("ChooseRoleView")
end
