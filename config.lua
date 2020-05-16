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
        google =
        {
            mapsKey = "AIzaSyBoQajaQUvbRsSxEYK036WJlN1ZnP0TzSc",
            key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtK+fVSMCqnn7QnRN6uS1CM3LFR1pExNzolN8UnIT1wdHC2gawfcVTBjyCijRRkQz+pYf6gSBvZzdAfjwddbRwnU8ZoEVkq13vlGNek49vcIMrksdrKThjsYN9wUbagfiOvrJyg0c9t7a2/ouBExORbXM6KZzVtmVajUIZFdZ+aNXjXDatsled78sy7Nfjq0DExRJqtHjXLp6yaBnSQhVQ3QZTnZQP6ziZZBKHJNM3z4wtZvbDs7qXmEAf+fcSt4x/6NML3PgSBQpieEvZMZwIbfiYQKRqQZsWFTG5Ls8j6ixyKrGbgTD3dj8moxGa3S88xTVy1S6AZRFywQDoCM0UQIDAQAB"
            
        },
    },
}
if (not (display.screenOriginX == display.safeScreenOriginX and 
         display.screenOriginY == display.safeScreenOriginY and
         display.actualContentWidth == display.safeActualContentWidth and
         display.actualContentHeight == display.safeActualContentHeight)) then
       
       print(application.content.width, application.content.height, "ooga")

end