-- QuickApp POLLEN (AccuWeather)

-- This QuickApp gives access to real-time and 5-day forecast pollen count and risk category for grass pollen, mold spores, ragweed pollen and tree pollen of any location from Accuweather.com

-- Pollen is a fine powder produced by trees and plants
-- Pollen can severely affect people, especially those with different ailments such as asthma and respiratory issues.
-- It can aggravate these existing conditions or cause these issues in high risk groups

-- Grass Pollen: Pollen grains from grasses
-- Mold Spores: The fungus produces spores that can become airborne
-- Radweed Pollen: Ragweeds are annual and perennial herbs and shrubs. A single plant may produce about a billion grains of pollen per season. 
-- Tree Pollen: Pollen from trees such as Birch and Oak

-- The QuickApp provides a risk evaluation with levels in particles/m³

-- Grass Pollen
-- Category Name  Begin Range  End Range
-- Low            0            4.99
-- Moderate       5            19.99
-- High           20           199.99
-- Very High      200	          299.99
-- Extreme        300          1000000

-- Mold Spores
-- Category Name  Begin Range  End Range
-- Low            0            6499.99
-- Moderate       6500         12999.99
-- High	          13000        49999.99
-- Very High      50000        64999.99
-- Extreme        65000        1000000

-- Ragweed Pollen
-- Category Name  Begin Range  End Range
-- Low            0            9.99
-- Moderate       10           49.99
-- High           50           499.99
-- Very High      500          649.99
-- Extreme        650          1000000
 
-- Tree Pollen
-- Category Name  Begin Range  End Range
-- Low            0            14.99
-- Moderate       15           89.99
-- High           90           1499.99
-- Very High      1500         2999.99
-- Extreme        3000         1000000


-- IMPORTANT
-- You need an API key from https://developer.accuweather.com
-- The API is free up to 50 API calls/day, one key


-- Version 0.1 (22th August 2021)
-- Initial version
-- ToDo: convert remaining date/time to format


-- Variables (mandatory): 
-- apiKey = Get your free API key from AccuWeather
-- locationKey =  AccuWeather number from your HC3 Lon/Lat
-- interval = [number] in seconds time to get the data from the API
-- timeout = [number] in seconds for http timeout
-- debugLevel = Number (1=some, 2=few, 3=all, 4=simulation mode) (default = 1)
-- icon = [numbber] User defined icon number (add the icon via an other device and lookup the number)


-- No editing of this code is needed 


class 'Grass'(QuickAppChild)
function Grass:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Grass initiated, deviceId:",self.id)
end
function Grass:updateValue(data) 
  self:updateProperty("value",tonumber(data.ValueGrass1))
  self:updateProperty("unit", "")
  self:updateProperty("log", data.CategoryGrass1 .." risk")
end

class 'Mold'(QuickAppChild)
function Mold:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Mold initiated, deviceId:",self.id)
end
function Mold:updateValue(data) 
  self:updateProperty("value",tonumber(data.ValueMold1))
  self:updateProperty("unit", "")
  self:updateProperty("log", data.CategoryMold1 .." risk")
end

class 'Ragweed'(QuickAppChild)
function Ragweed:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Ragweed initiated, deviceId:",self.id)
end
function Ragweed:updateValue(data) 
  self:updateProperty("value",tonumber(data.ValueRagweed1)) 
  self:updateProperty("unit", "")
  self:updateProperty("log", data.CategoryRagweed1 .." risk")
end

class 'Tree'(QuickAppChild)
function Tree:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Tree initiated, deviceId:",self.id)
end
function Tree:updateValue(data) 
  self:updateProperty("value",tonumber(data.ValueTree1)) 
  self:updateProperty("unit", "")
  self:updateProperty("log", data.CategoryTree1 .." risk")
end


-- QuickApp functions


local function getChildVariable(child,varName)
  for _,v in ipairs(child.properties.quickAppVariables or {}) do
    if v.name==varName then return v.value end
  end
  return ""
end


function QuickApp:logging(level,text) -- Logging function for debug
  if tonumber(debugLevel) >= tonumber(level) then 
      self:debug(text)
  end
end


function QuickApp:updateProperties() --Update properties
  self:logging(3,"updateProperties")
  self:updateProperty("log", data.LocalDateTime)
end


function QuickApp:updateLabels() -- Update labels
  self:logging(3,"updateLabels")
  local labelText = ""
  if debugLevel == 4 then
    labelText = labelText .."SIMULATION MODE" .."\n\n"
  end
  labelText = labelText .."Today " .."\n"
  labelText = labelText .."Grass Pollen: " ..data.ValueGrass1 .." (" ..data.CategoryGrass1 .." risk)" .."\n"
  labelText = labelText .."Mold Spores: " ..data.ValueMold1 .." (" ..data.CategoryMold1 .." risk)" .."\n"
  labelText = labelText .."Ragweed Pollen: " ..data.ValueRagweed1 .." (" ..data.CategoryRagweed1 .." risk)" .."\n"
  labelText = labelText .."Tree Pollen:  " ..data.ValueTree1 .." (" ..data.CategoryTree1 .." risk)" .."\n\n"
  
  labelText = labelText .."Date: " ..data.LocalDateTime2 .."\n"
  labelText = labelText .."Grass Pollen: " ..data.ValueGrass2 .." (" ..data.CategoryGrass2 .." risk)" .."\n"
  labelText = labelText .."Mold Spores: " ..data.ValueMold2 .." (" ..data.CategoryMold2 .." risk)" .."\n"
  labelText = labelText .."Ragweed Pollen: " ..data.ValueRagweed2 .." (" ..data.CategoryRagweed2 .." risk)" .."\n"
  labelText = labelText .."Tree Pollen:  " ..data.ValueTree2 .." (" ..data.CategoryTree2 .." risk)" .."\n\n"
  
  labelText = labelText .."Date: " ..data.LocalDateTime3 .."\n"
  labelText = labelText .."Grass Pollen: " ..data.ValueGrass3 .." (" ..data.CategoryGrass3 .." risk)" .."\n"
  labelText = labelText .."Mold Spores: " ..data.ValueMold3 .." (" ..data.CategoryMold3 .." risk)" .."\n"
  labelText = labelText .."Ragweed Pollen: " ..data.ValueRagweed3 .." (" ..data.CategoryRagweed3 .." risk)" .."\n"
  labelText = labelText .."Tree Pollen:  " ..data.ValueTree3 .." (" ..data.CategoryTree3 .." risk)" .."\n\n"
  
  labelText = labelText .."Date: " ..data.LocalDateTime4 .."\n"
  labelText = labelText .."Grass Pollen: " ..data.ValueGrass4 .." (" ..data.CategoryGrass4 .." risk)" .."\n"
  labelText = labelText .."Mold Spores: " ..data.ValueMold4 .." (" ..data.CategoryMold4 .." risk)" .."\n"
  labelText = labelText .."Ragweed Pollen: " ..data.ValueRagweed4 .." (" ..data.CategoryRagweed4 .." risk)" .."\n"
  labelText = labelText .."Tree Pollen:  " ..data.ValueTree4 .." (" ..data.CategoryTree4 .." risk)" .."\n\n"
  
  labelText = labelText .."Date: " ..data.LocalDateTime5 .."\n"
  labelText = labelText .."Grass Pollen: " ..data.ValueGrass5 .." (" ..data.CategoryGrass5 .." risk)" .."\n"
  labelText = labelText .."Mold Spores: " ..data.ValueMold5 .." (" ..data.CategoryMold5 .." risk)" .."\n"
  labelText = labelText .."Ragweed Pollen: " ..data.ValueRagweed5 .." (" ..data.CategoryRagweed5 .." risk)" .."\n"
  labelText = labelText .."Tree Pollen:  " ..data.ValueTree5 .." (" ..data.CategoryTree5 .." risk)" .."\n\n"

  labelText = labelText .."Measured: " ..data.LocalDateTime .."\n"
  
  self:logging(2,"labelText: " ..labelText)
  self:updateView("label1", "text", labelText) 
end


function QuickApp:getValues() -- Get the values
  self:logging(3,"getValues")
  data.LocalDateTime1 = jsonTable[1].LocalDateTime
  data.ValueTree1 = string.format("%.1f",jsonTable[1].Value) -- Tree (ID:-14)
  data.CategoryTree1 = jsonTable[1].Category
  data.ValueRagweed1 = string.format("%.1f",jsonTable[2].Value) -- Ragweed (ID:-13)
  data.CategoryRagweed1 = jsonTable[2].Category
  data.ValueMold1 = string.format("%.1f",jsonTable[3].Value) -- Mold (ID:-12)
  data.CategoryMold1 = jsonTable[3].Category
  data.ValueGrass1 = string.format("%.1f",jsonTable[4].Value) -- Grass (ID:-11)
  data.CategoryGrass1 = jsonTable[4].Category

  data.LocalDateTime2 = jsonTable[5].LocalDateTime
  data.ValueTree2 = string.format("%.1f",jsonTable[5].Value) -- Tree (ID:-14)
  data.CategoryTree2 = jsonTable[5].Category
  data.ValueRagweed2 = string.format("%.1f",jsonTable[6].Value) -- Ragweed (ID:-13)
  data.CategoryRagweed2 = jsonTable[6].Category
  data.ValueMold2 = string.format("%.1f",jsonTable[7].Value) -- Mold (ID:-12)
  data.CategoryMold2 = jsonTable[7].Category
  data.ValueGrass2 = string.format("%.1f",jsonTable[8].Value) -- Grass (ID:-11)
  data.CategoryGrass2 = jsonTable[8].Category

  data.LocalDateTime3 = jsonTable[9].LocalDateTime
  data.ValueTree3 = string.format("%.1f",jsonTable[9].Value) -- Tree (ID:-14)
  data.CategoryTree3 = jsonTable[9].Category
  data.ValueRagweed3 = string.format("%.1f",jsonTable[10].Value) -- Ragweed (ID:-13)
  data.CategoryRagweed3 = jsonTable[10].Category
  data.ValueMold3 = string.format("%.1f",jsonTable[11].Value) -- Mold (ID:-12)
  data.CategoryMold3 = jsonTable[11].Category
  data.ValueGrass3 = string.format("%.1f",jsonTable[12].Value) -- Grass (ID:-11)
  data.CategoryGrass3 = jsonTable[12].Category
  
  data.LocalDateTime4 = jsonTable[13].LocalDateTime
  data.ValueTree4 = string.format("%.1f",jsonTable[13].Value) -- Tree (ID:-14)
  data.CategoryTree4 = jsonTable[13].Category
  data.ValueRagweed4 = string.format("%.1f",jsonTable[14].Value) -- Ragweed (ID:-13)
  data.CategoryRagweed4 = jsonTable[14].Category
  data.ValueMold4 = string.format("%.1f",jsonTable[15].Value) -- Mold (ID:-12)
  data.CategoryMold4 = jsonTable[15].Category
  data.ValueGrass4 = string.format("%.1f",jsonTable[16].Value) -- Grass (ID:-11)
  data.CategoryGrass4 = jsonTable[16].Category
  
  data.LocalDateTime5 = jsonTable[17].LocalDateTime
  data.ValueTree5 = string.format("%.1f",jsonTable[17].Value) -- Tree (ID:-14)
  data.CategoryTree5 = jsonTable[17].Category
  data.ValueRagweed5 = string.format("%.1f",jsonTable[18].Value) -- Ragweed (ID:-13)
  data.CategoryRagweed5 = jsonTable[18].Category
  data.ValueMold5 = string.format("%.1f",jsonTable[19].Value) -- Mold (ID:-12)
  data.CategoryMold5 = jsonTable[19].Category
  data.ValueGrass5 = string.format("%.1f",jsonTable[20].Value) -- Grass (ID:-11)
  data.CategoryGrass5 = jsonTable[20].Category
    
  local EpochDateTime = jsonTable[1].EpochDateTime
    -- Check timezone and daylight saving time
  local timezone = os.difftime(os.time(), os.time(os.date("!*t",os.time())))/3600
  if os.date("*t").isdst then -- Check daylight saving time 
    timezone = timezone + 1
  end
  self:logging(3,"Timezone + dst: " ..timezone)
  data.LocalDateTime = os.date("%d-%m-%Y %H:%M", (EpochDateTime+(timezone*3600)))

  -- Convert time of measurement to local timezone
  --local pattern = "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)"
  --data.LocalDateTime1 = data.LocalDateTime1:gsub("%.000Z", "") -- Clean up date/time
  --local runyear, runmonth, runday, runhour, runminute, runseconds = data.LocalDateTime1:match(pattern)
  --local convertedTimestamp = os.time({year = runyear, month = runmonth, day = runday, hour = runhour, min = runminute, sec = runseconds})
  --data.LocalDateTime1 = os.date("%d-%m-%Y %X", convertedTimestamp + (timezone*3600))
end


function QuickApp:simData() -- Simulate AccuWeather API
  self:logging(3,"Simulation mode")
  local apiResult = '[{"Name":"Tree Pollen","ID":-14,"Ascending":false,"LocalDateTime":"2021-08-18T07:00:00+02:00","EpochDateTime":1629262800,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Ragweed Pollen","ID":-13,"Ascending":false,"LocalDateTime":"2021-08-18T07:00:00+02:00","EpochDateTime":1629262800,"Value":2.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Mold","ID":-12,"Ascending":false,"LocalDateTime":"2021-08-18T07:00:00+02:00","EpochDateTime":1629262800,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Grass Pollen","ID":-11,"Ascending":false,"LocalDateTime":"2021-08-18T07:00:00+02:00","EpochDateTime":1629262800,"Value":3.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Tree Pollen","ID":-14,"Ascending":false,"LocalDateTime":"2021-08-19T07:00:00+02:00","EpochDateTime":1629349200,"Value":3.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Ragweed Pollen","ID":-13,"Ascending":false,"LocalDateTime":"2021-08-19T07:00:00+02:00","EpochDateTime":1629349200,"Value":2.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Mold","ID":-12,"Ascending":false,"LocalDateTime":"2021-08-19T07:00:00+02:00","EpochDateTime":1629349200,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Grass Pollen","ID":-11,"Ascending":false,"LocalDateTime":"2021-08-19T07:00:00+02:00","EpochDateTime":1629349200,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Tree Pollen","ID":-14,"Ascending":false,"LocalDateTime":"2021-08-20T07:00:00+02:00","EpochDateTime":1629435600,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Ragweed Pollen","ID":-13,"Ascending":false,"LocalDateTime":"2021-08-20T07:00:00+02:00","EpochDateTime":1629435600,"Value":2.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Mold","ID":-12,"Ascending":false,"LocalDateTime":"2021-08-20T07:00:00+02:00","EpochDateTime":1629435600,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Grass Pollen","ID":-11,"Ascending":false,"LocalDateTime":"2021-08-20T07:00:00+02:00","EpochDateTime":1629435600,"Value":3.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Tree Pollen","ID":-14,"Ascending":false,"LocalDateTime":"2021-08-21T07:00:00+02:00","EpochDateTime":1629522000,"Value":3.0,"Category":"Moderate","CategoryValue":2,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Ragweed Pollen","ID":-13,"Ascending":false,"LocalDateTime":"2021-08-21T07:00:00+02:00","EpochDateTime":1629522000,"Value":2.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Mold","ID":-12,"Ascending":false,"LocalDateTime":"2021-08-21T07:00:00+02:00","EpochDateTime":1629522000,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Grass Pollen","ID":-11,"Ascending":false,"LocalDateTime":"2021-08-21T07:00:00+02:00","EpochDateTime":1629522000,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Tree Pollen","ID":-14,"Ascending":false,"LocalDateTime":"2021-08-22T07:00:00+02:00","EpochDateTime":1629608400,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Ragweed Pollen","ID":-13,"Ascending":false,"LocalDateTime":"2021-08-22T07:00:00+02:00","EpochDateTime":1629608400,"Value":2.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Mold","ID":-12,"Ascending":false,"LocalDateTime":"2021-08-22T07:00:00+02:00","EpochDateTime":1629608400,"Value":1.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"},{"Name":"Grass Pollen","ID":-11,"Ascending":false,"LocalDateTime":"2021-08-22T07:00:00+02:00","EpochDateTime":1629608400,"Value":3.0,"Category":"Low","CategoryValue":1,"MobileLink":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us","Link":"http://www.accuweather.com/en/nl/de-bilt/250542/allergies-weather/873892?lang=en-us"}]'
  
  self:logging(3,"apiResult: " ..apiResult)

  jsonTable = json.decode(apiResult) -- Decode the json string from api to lua-table 
  
  self:getValues()
  self:updateLabels()
  self:updateProperties()

  for id,child in pairs(self.childDevices) do 
    child:updateValue(data) 
  end
  
  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout(interval*1000, function() 
     self:simData()
  end)
end


function QuickApp:getData()
  self:logging(3,"Start getData")
  self:logging(2,"URL: " ..address)
    
  http:request(address, {
    options = {data = Method, method = "GET", headers = {["Content-Type"] = "application/json",["Accept"] = "application/json",}},
    
      success = function(response)
        self:logging(3,"response status: " ..response.status)
        self:logging(3,"headers: " ..response.headers["Content-Type"])
        self:logging(2,"Response data: " ..response.data)

        if response.data == nil or response.data == "" or response.data == "[]" or response.status > 200 then -- Check for empty result
          self:warning("Temporarily no data from AccuWeather")
          self:warning(response.data)
          return
        end

        jsonTable = json.decode(response.data) -- JSON decode from api to lua-table

        self:getValues()
        self:updateLabels()
        self:updateProperties()

        for id,child in pairs(self.childDevices) do 
          child:updateValue(data) 
        end
      
      end,
      error = function(error)
        self:error('error: ' ..json.encode(error))
        self:updateProperty("log", "error: " ..json.encode(error))
      end
    }) 

  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout((interval)*1000, function() 
     self:getData()
  end)
end


function QuickApp:createVariables() -- Get all Quickapp Variables or create them
  data = {}
  data.LocalDateTime = ""
  data.LocalDateTime1 = ""
  data.ValueGrass1 = "0"
  data.ValueMold1 = "0"
  data.ValueRagweed1 = "0"
  data.ValueTree1 = "0"
  data.CategoryGrass1 = "n/a"
  data.CategoryMold1 = "n/a"
  data.CategoryRagweed1 = "n/a"
  data.CategoryTree1 = "n/a"
  
  data.LocalDateTime2 = ""
  data.ValueGrass2 = "0"
  data.ValueMold2 = "0"
  data.ValueRagweed2 = "0"
  data.ValueTree2 = "0"
  data.CategoryGrass2 = "n/a"
  data.CategoryMold2 = "n/a"
  data.CategoryRagweed2 = "n/a"
  data.CategoryTree2 = "n/a"
  
  data.LocalDateTime3 = ""
  data.ValueGrass3 = "0"
  data.ValueMold3 = "0"
  data.ValueRagweed3 = "0"
  data.ValueTree3 = "0"
  data.CategoryGrass3 = "n/a"
  data.CategoryMold3 = "n/a"
  data.CategoryRagweed3 = "n/a"
  data.CategoryTree3 = "n/a"
  
  data.LocalDateTime4 = ""
  data.ValueGrass4 = "0"
  data.ValueMold4 = "0"
  data.ValueRagweed4 = "0"
  data.ValueTree4 = "0"
  data.CategoryGrass4 = "n/a"
  data.CategoryMold4 = "n/a"
  data.CategoryRagweed4 = "n/a"
  data.CategoryTree4 = "n/a"
  
  data.LocalDateTime5 = ""
  data.ValueGrass5 = "0"
  data.ValueMold5 = "0"
  data.ValueRagweed5 = "0"
  data.ValueTree5 = "0"
  data.CategoryGrass5 = "n/a"
  data.CategoryMold5 = "n/a"
  data.CategoryRagweed5 = "n/a"
  data.CategoryTree5 = "n/a"
  
end


function QuickApp:checkLocationKey() -- Get the locationKey from AccuWeather based on your HC3 Lat/Lon
  self:logging(3,"Start checkLocationKey")
  
  if locationKey == "" or locationKey == "0" or locationKey == nil then

    latitude = string.format("%.2f",api.get("/settings/location")["latitude"]) -- Default latitude of your HC3
    longitude = string.format("%.2f",api.get("/settings/location")["longitude"]) -- Default longitude of your HC3

    local url = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=" ..apiKey .."&q=" ..latitude .."%2C" ..longitude .."&details=true"
    self:logging(2,"URL: " ..url)

    http:request(url, {
      options = {data = Method, method = "GET", headers = {["Content-Type"] = "application/json",["Accept"] = "application/json",}},
    
        success = function(response)
          self:logging(3,"response status: " ..response.status)
          self:logging(3,"headers: " ..response.headers["Content-Type"])
          self:logging(2,"Response data: " ..response.data)

          if response.data == nil or response.data == "" or response.data == "[]" or response.status > 200 then -- Check for empty result
            self:warning("Temporarily no locationKey from AccuWeather")
            self:warning(response.data)
            --locationKey = "250542" -- De Bilt
            return
          end

          geoTable = json.decode(response.data) -- JSON decode from api to lua-table
          locationKey = tostring(geoTable.Key)
      
        end,
        error = function(error)
          self:error('error: ' ..json.encode(error))
            self:updateProperty("log", "error: " ..json.encode(error))
        end
    }) 
    self:logging(3,"LocationKey: " ..LocationKey)
    self:setVariable("locationKey", locationKey)
    self:trace("Added QuickApp variable locationKey: " ..locationKey)
  end
end


function QuickApp:getQuickAppVariables() -- Get all variables 
  apiKey = self:getVariable("apiKey")
  locationKey = self:getVariable("locationKey")
  interval = tonumber(self:getVariable("interval")) 
  httpTimeout = tonumber(self:getVariable("httpTimeout")) 
  debugLevel = tonumber(self:getVariable("debugLevel"))
  local icon = tonumber(self:getVariable("icon")) 

  if apiKey == "" or apiKey == "0" or apiKey == nil then
    apiKey = "0" 
    self:setVariable("apiKey",apiKey)
    self:trace("Added QuickApp variable apiKey")
  end
  if locationKey == "" or locationKey == "0" or locationKey == nil then
    locationKey = "250542" 
    self:setVariable("locationKey",locationKey)
    self:trace("Added QuickApp variable locationKey")
  end
  if interval == "" or interval == nil then
    interval = "2400" -- Free account includes up to 50 calls a day, so default value is 2400 (every 40 minutes)
    self:setVariable("interval",interval)
    self:trace("Added QuickApp variable interval: " ..interval)
    interval = tonumber(interval)
  end  
  if httpTimeout == "" or httpTimeout == nil then
    httpTimeout = "5" -- timeoout in seconds
    self:setVariable("httpTimeout",httpTimeout)
    self:trace("Added QuickApp variable httpTimeout")
    httpTimeout = tonumber(httpTimeout)
  end
  if debugLevel == "" or debugLevel == nil then
    debugLevel = "1" -- Default value for debugLevel response in seconds
    self:setVariable("debugLevel",debugLevel)
    self:trace("Added QuickApp variable debugLevel")
    debugLevel = tonumber(debugLevel)
  end
  if icon == "" or icon == nil then 
    icon = "0" -- Default icon
    self:setVariable("icon",icon)
    self:trace("Added QuickApp variable icon")
    icon = tonumber(icon)
  end
  if icon ~= 0 then 
    self:updateProperty("deviceIcon", icon) -- set user defined icon 
  end
  
  address = "http://dataservice.accuweather.com/indices/v1/daily/5day/" ..locationKey .."/groups/30?apikey=" ..apiKey .."&details=false"

  if apiKey == nil or apiKey == ""  or apiKey == "0" then -- Check mandatory API key 
    self:error("API key is empty! Get your free API key from AccuWeather")
    self:warning("No API Key: Switched to Simulation Mode")
    debugLevel = 4 -- Simulation mode due to empty API key
  end

end


function QuickApp:setupChildDevices()
  local cdevs = api.get("/devices?parentId="..self.id) or {} -- Pick up all my children 
  function self:initChildDevices() end -- Null function, else Fibaro calls it after onInit()...

  if #cdevs==0 then -- No children, create children
    local initChildData = { 
      {className="Grass", name="Grass", type="com.fibaro.multilevelSensor", value=0},
      {className="Mold", name="Mold", type="com.fibaro.multilevelSensor", value=0},
      {className="Ragweed", name="Ragweed", type="com.fibaro.multilevelSensor", value=0},
      {className="Tree", name="Tree", type="com.fibaro.multilevelSensor", value=0},
    }
    for _,c in ipairs(initChildData) do
      local child = self:createChildDevice(
        {name = c.name,
          type=c.type,
          value=c.value,
          unit=c.unit,
          initialInterfaces = {}, 
        },
        _G[c.className] -- Fetch class constructor from class name
      )
      child:setVariable("className",c.className)  -- Save class name so we know when we load it next time
    end   
  else 
    for _,child in ipairs(cdevs) do
      local className = getChildVariable(child,"className") -- Fetch child class name
      local childObject = _G[className](child) -- Create child object from the constructor name
      self.childDevices[child.id]=childObject
      childObject.parent = self -- Setup parent link to device controller 
    end
  end
end


function QuickApp:onInit()
  __TAG = fibaro.getName(plugin.mainDeviceId) .." ID:" ..plugin.mainDeviceId
  self:debug("onInit") 
  
  self:setupChildDevices() -- Setup the Child Devices
  self:getQuickAppVariables() -- Get Quickapp Variables or create them
  self:createVariables() -- Create Variables
  
  http = net.HTTPClient({timeout=httpTimeout*1000})

  if tonumber(debugLevel) >= 4 then 
    self:simData() -- Go in simulation
  else
    --self:checkLocationKey() -- Check the locationKey 
    self:getData() -- Get data from API
  end
end

--EOF
