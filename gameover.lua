local composer = require("composer")
local scene = composer.newScene()
local starFieldGenerator = require("starfieldgenerator")
local pulsatingText = require("pulsatingtext")
local nextLevelButton
local starGenerator
function scene:create( event )
    local group = self.view
    starGenerator =  starFieldGenerator.new(200,group,5)
    local   invadersText =  pulsatingText.new("LEVEL COMPLETE", display.contentCenterX, display.contentCenterY-200,"Conquest", 20,group )
    invadersText:setColor( 1, 1, 1 )
    invadersText:pulsate()
    nextLevelButton = display.newImage("next_level_btn.png",display.contentCenterX, display.contentCenterY)
    group:insert(nextLevelButton)
 end

function scene:show( event )
    local phase = event.phase
    composer.removeScene("gamelevel" )
    if ( phase == "did" ) then
      nextLevelButton:addEventListener("tap",startNewGame)
      Runtime:addEventListener ( "enterFrame", starGenerator)
    end
end

function scene:hide(event )
    local phase = event.phase
    if ( phase == "will" ) then
        Runtime:removeEventListener("enterFrame", starGenerator)
        nextLevelButton:removeEventListener("tap",startNewGame)
    end
end


function startNewGame()
    composer.gotoScene("gamelevel")
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene