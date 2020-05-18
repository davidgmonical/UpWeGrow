local Data = {}

local sqlite3 = require( "sqlite3" )

-- Open "data.db". If the file doesn't exist, it will be created
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local exists = io.open(path,'r')
local db = sqlite3.open( path )  

-- Handle the "applicationExit" event to close the database
  local function onSystemEvent( event )
      if ( event.type == "applicationExit" ) then             
          db:close()
      end
  end
  
if (not(exists)) then
  
    
  -- Set up the table if it doesn't exist
  local tablesetup = [[CREATE TABLE IF NOT EXISTS gardeners (id INTEGER PRIMARY KEY, name, location, years, bio, username, password);]]
  db:exec( tablesetup )


  tablesetup = [[CREATE TABLE IF NOT EXISTS landowners (id INTEGER PRIMARY KEY, name, location, username, password);]]
  db:exec( tablesetup )
  
  tablesetup = [[CREATE TABLE IF NOT EXISTS timeslots (id INTEGER PRIMARY KEY, date, timestart, timeend);]]
  db:exec( tablesetup )
  
  tablesetup = [[CREATE TABLE IF NOT EXISTS g_timeslots (id INTEGER PRIMARY KEY, timeslot INTEGER, gardener INTEGER);]]
  db:exec( tablesetup )
  
  tablesetup = [[CREATE TABLE IF NOT EXISTS l_timeslots (id INTEGER PRIMARY KEY, timeslot INTEGER, landowner INTEGER);]]
  db:exec( tablesetup )

--  -- Add rows with an auto index in 'id'. You don't need to specify a set of values because we're populating all of them.
--  local testvalue = {"Howard Roman", "Waterloo", "10", "I love plants"}
--  local tablefill = [[INSERT INTO gardeners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[['); ]]

--  db:exec( tablefill )
  
  testvalue = {"Shirley Gardener", "550 King St North, Conestoga Mall, Waterloo, ON N2L 5W6, Canada", "sgardener@gmail.com", "password"}
  tablefill = [[INSERT INTO landowners VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[[',']]..testvalue[4]..[['); ]]

  db:exec( tablefill )
    
  testvalue = {"5/18/20", "9", "12"}
  tablefill = [[INSERT INTO timeslots VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[['); ]]

  db:exec( tablefill )  
  
  
  testvalue = {"5/17/20", "12", "3"}
  tablefill = [[INSERT INTO timeslots VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[[',']]..testvalue[3]..[['); ]]

  db:exec( tablefill )  
  
  -- Print the SQLite version
  print( "SQLite version " .. sqlite3.version() )
end

 
-- Setup the event listener to catch "applicationExit"
Runtime:addEventListener( "system", onSystemEvent )

local userIdFilePath = system.pathForFile("userId.txt", system.DocumentsDirectory)
local userIdFile = io.open(userIdFilePath, 'r')
if (userIdFile) then
  Data.userId = userIdFile:read("*a")
  userIdFile:close()
  userIdFile = nil
end

function Data:setUserId(id)
  local userIdFile = io.open(userIdFilePath, 'w')
  if (userIdFile) then
    userIdFile:write(id)
    userIdFile:close()
    userIdFile = nil
  end
  Data.userId = id
end

function Data:createGardener(name, location, years, bio, username, password)
  
  local tablefill = [[INSERT INTO gardeners VALUES (NULL, ']]..name..[[',']]..location..[[',']]..years..[[',']]..bio..[[',']]..username..[[',']]..password..[['); ]]
  print(tablefill)
  db:exec( tablefill )
  Data:setUserId(db:exec([[SELECT SCOPE_IDENTITY();]]))
  
end


function Data:createLandowner(name, location, username, password)
  
  local tablefill = [[INSERT INTO landowners VALUES (NULL, ']]..name..[[',']]..location..[[',']]..username..[[',']]..password..[['); ]]
  db:exec( tablefill )
  Data:setUserId(db:exec([[SELECT SCOPE_IDENTITY();]]))
  
end

function Data:getGardener()
  for row in db:nrows("SELECT * FROM gardeners WHERE id = "..Data.userId) do
    return row
  end
end

function Data:getLandowner()
  for row in db:nrows("SELECT * FROM landowners WHERE id = "..Data.userId) do
    return row
  end
end

function Data:getTimeSlots()
  local ts = {}
  for row in db:nrows("SELECT * FROM timeslots") do
    ts[#ts + 1] = row
  end
  return ts
end

function Data:signUpForSlot(id)
  
  local tablefill = [[INSERT INTO g_timeslots VALUES (NULL, ']]..id..[[',']]..Data.userId..[['); ]]
  db:exec( tablefill )
  
end

function Data:abandonSlot(id)
  
  local tablefill = [[DELETE FROM g_timeslots WHERE timeslot = ]]..id..[[ AND gardener = ]]..Data.userId..[[;]]
  db:exec( tablefill )
  db:exec("COMMIT;")
  
end

function Data:login(u, p)
  for row in db:nrows([[SELECT * FROM gardeners WHERE username = ]]..[[']]..u..[[']].." AND password = "..[[']]..p..[[']]..[[;]]) do
    return "G"
  end
  
  for row in db:nrows([[SELECT * FROM landowners WHERE username = ]]..[[']]..u..[[']].." AND password = "..[[']]..p..[[']]..[[;]]) do
    return "L"
  end
  
  return "N"

end


return Data
