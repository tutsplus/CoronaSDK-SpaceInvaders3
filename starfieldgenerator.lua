local starFieldGenerator= {}
local starFieldGenerator_mt = {__index = starFieldGenerator}



function starFieldGenerator.new(numberOfStars,theView,starSpeed)
	local starGroup = display.newGroup()
    local allStars	 ={} -- Table that holds all the stars

    for i=0, numberOfStars do
		local star = display.newCircle(math.random(display.contentWidth), math.random(display.contentHeight), math.random(2,8))
		star:setFillColor(1 ,1,1)
		starGroup:insert(star)
		theView:insert(starGroup)
		table.insert(allStars,star)
    end
	  local newStarFieldGenerator = {
                                               					allStars    =  allStars,
                                               					starSpeed = starSpeed
                                               			 }
		
return setmetatable(newStarFieldGenerator,starFieldGenerator_mt)
end


function starFieldGenerator:enterFrame()
	self:moveStars()
	self:checkStarsOutOfBounds()
end


function starFieldGenerator:moveStars()
        for i=1, #self.allStars do
              self.allStars[i].y = self.allStars[i].y+self.starSpeed
        end

end
function  starFieldGenerator:checkStarsOutOfBounds()
	for i=1, #self.allStars do
		if(self.allStars[i].y > display.contentHeight) then
			self.allStars[i].x  = math.random(display.contentWidth)
			self.allStars[i].y = 0
		end
	end
end

return starFieldGenerator