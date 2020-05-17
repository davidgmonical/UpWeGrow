local DisplayFunctions = {}

function DisplayFunctions:createDisplayImg(image, w, h, aX, aY, x, y, group)
    local obj = display.newImageRect(image, w, h)
    self:setObjPos(obj, aX, aY, x, y)
    if group then group:insert(obj) end
    return obj
end

function DisplayFunctions:createDisplayText(text, font, size, aX, aY, x, y, group, embossed, color, colorH, colorS)
    local obj
    if(embossed) then
        obj = display.newEmbossedText(text, x, y, font, size)
        if(colorH and colorS) then
            obj:setFillColor(color[1], color[2], color[3])
            local color = {highlight = { r=colorH[1], g=colorH[2], b=colorH[3] },shadow = {r=colorS[1], g=colorS[2], b=colorS[3]}}
            obj:setEmbossColor(color)
        end
    else
        obj = display.newText(text, x, y, font, size)
        obj:setFillColor(color[1], color[2], color[3])
    end
    self:setObjPos(obj, aX, aY, x, y)
    if group then group:insert(obj) end
    return obj
end

function DisplayFunctions:updateText(obj, text)
    local oldAX = obj.anchorX
    local oldAY = obj.anchorY
    local oldX = obj.x
    local oldY = obj.y
    obj.text = text
    obj.anchorX = oldAX
    obj.anchorY = oldAY
    obj.x = oldX
    obj.y = oldY
end

function DisplayFunctions:createSprite(imageSheet, sequenceData, aX, aY, x, y, group)
    local obj = display.newSprite(imageSheet, sequenceData)
    if group then group:insert(obj) end
    DisplayFunctions:setObjPos(obj, aX, aY, x, y)
    return obj
end

function DisplayFunctions:createRect(w, h, aX, aY, x, y, color, group)
    local obj = display.newRect(0, 0, w, h)
    obj:setFillColor(color[1], color[2], color[3])
    if group then group:insert(obj) end
    DisplayFunctions:setObjPos(obj, aX, aY, x, y)
    return obj
end

function DisplayFunctions:createRoundedRect(w, h, aX, aY, x, y, radius, color, group)
    local obj = display.newRoundedRect(0, 0, w, h, radius)
    obj:setFillColor(color[1], color[2], color[3])
    if group then group:insert(obj) end
    DisplayFunctions:setObjPos(obj, aX, aY, x, y)
    return obj
end

function DisplayFunctions:setObjPos(obj, aX, aY, x, y)
    obj.anchorX = aX
    obj.anchorY = aY
    obj.x = x
    obj.y = y
end

return DisplayFunctions
