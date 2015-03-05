--local storyboard = require( "storyboard" )
local composer = require("composer")

local scene = composer.newScene()
local startButton
 
local pulsatingText = require("pulsatingtext")
local starFieldGenerator = require("starfieldgenerator")
 local starGenerator


function scene:create( event )
        local group = self.view

       starGenerator =  starFieldGenerator.new(200,group,5)
      
local   invadersText =  pulsatingText.new( "INVADERZ",display.contentCenterX,display.contentCenterY-200,"Conquest", 20 )
      	invadersText:insertIntoGroup(group)
       	invadersText:setColor( 1, 1, 1 )
       	 invadersText:pulsate()
       	 startButton = display.newImage("new_game_btn.png",display.contentCenterX,display.contentCenterY+100)
        group:insert(startButton)

end
-- Called immediately after scene has moved onscreen:

function startGame()
	
	composer.gotoScene("gamelevel")
end
function scene:show( event )
	local phase = event.phase
    local previousScene = composer.getSceneName( "previous" )
	if(previousScene~=nil) then

     composer.removeScene(previousScene)
	end
   if ( phase == "did" ) then
   startButton:addEventListener("tap",startGame)
	Runtime:addEventListener("enterFrame", starGenerator)
   end


end

function scene:hide( event )
		local phase = event.phase
		if ( phase == "will" ) then
    		startButton:removeEventListener("tap",startGame)

            Runtime:removeEventListener("enterFrame", starGenerator)
		end
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene