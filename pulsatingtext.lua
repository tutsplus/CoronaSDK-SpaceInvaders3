local pulsatingText = {}
local pulsatingText_mt = {__index = pulsatingText}



function pulsatingText.new(theText,positionX,positionY,theFont,theFontSize,theGroup)
	  local theTextField = display.newText(theText,positionX,positionY,theFont,theFontSize)	  local newPulsatingText = {
                                                  theTextField = theTextField}     theGroup:insert(theTextField)                                             
	return setmetatable(newPulsatingText,pulsatingText_mt)
end

function pulsatingText:setColor(r,b,g)
  self.theTextField:setFillColor(r,g,b)
end

function pulsatingText:pulsate()
	transition.to( self.theTextField, { xScale=4.0, yScale=4.0, time=1500, iterations = -1} )
end

return pulsatingText