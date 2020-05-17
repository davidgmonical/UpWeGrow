local aspectRatio = display.pixelHeight/display.pixelWidth

application = {
    content = {
        width = aspectRatio>1.5 and 320 or math.ceil( 480/aspectRatio ),
        height = aspectRatio<1.5 and 480 or math.ceil( 320*aspectRatio ),
        scale = "letterBox",
        fps = 60,
        imageSuffix = {
            ["@2x"] = 1.5,
            ["@4x"] = 3.0,
        },
    },
    license =
    {
       
    },
}
if (not (display.screenOriginX == display.safeScreenOriginX and 
         display.screenOriginY == display.safeScreenOriginY and
         display.actualContentWidth == display.safeActualContentWidth and
         display.actualContentHeight == display.safeActualContentHeight)) then
       
       print(application.content.width, application.content.height, "ooga")

end