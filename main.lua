display.setStatusBar(display.HiddenStatusBar)
display.setDefault( "anchorX", 0.5)
display.setDefault( "anchorY", 0.5)
math.randomseed( os.time() ) 
local gameData = require( "gamedata" )
gameData.invaderNum = 1 --Used to keep track of the Level we are on
gameData.maxLevels = 3 -- Max number of Levels the game will have
gameData.rowsOfInvaders = 4 -- How many rows of Invaders to create
local composer = require ("composer")
composer.gotoScene( "start" )