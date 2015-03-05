local gameData = require( "gamedata" )

display.setStatusBar(display.HiddenStatusBar)
display.setDefault( "anchorX", 0.5)
display.setDefault( "anchorY", 0.5)
math.randomseed( os.time() ) 
gameData.invaderNum =1
gameData.maxLevels = 3
gameData.rowsOfInvaders = 4

---local storyboard = require "storyboard"local composer = require  ("composer")
composer.gotoScene( "start" )

