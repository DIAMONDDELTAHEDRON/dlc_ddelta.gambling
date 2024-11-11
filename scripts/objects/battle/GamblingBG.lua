local GamblingBG, super = Class(Object)

function GamblingBG:init(color, back_color, fill)
    super.init(self)

    self.color = color
    self.back_color = back_color or color
    self.fill = fill or {0, 0, 0}
	self.offset = 0
    self.speed = 0.5
    self.size = 50
    self.slot_y = {0,0,0}
    self.slot_index = 0
	self.layer = BATTLE_LAYERS["bottom"]
	self.alpha_fx = self:addFX(AlphaFX())
    self.image = Assets.getFrames("battle/slot_battleback")
end

function GamblingBG:update()
    super.update(self)
    self.fade = Game.battle.transition_timer / 10
	self.offset = self.offset + self.speed*DTMULT

    if self.offset > self.size*2 then
        self.offset = self.offset - self.size*2
    end

	self.alpha_fx.alpha = Game.battle.transition_timer / 10
end

function GamblingBG:draw()
    super.draw(self)

    self:drawFill()
	self:drawFront()
end

function GamblingBG:drawFill()
    local r,g,b,a = unpack(self.fill)
    love.graphics.setColor(r,g,b, a or self.fade)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)
end

function GamblingBG:drawFront()
    local r,g,b,a = unpack(self.color)
    love.graphics.setColor(r,g,b, a or self.fade)
	for x = 0, 740, 25 do
        local i = 0
		for y = 0, 580, 50 do
			love.graphics.draw(self.image[self.slot_index[i]], x - self.offset, y - self.offset)
            i = i + 1
            if i >= self.slot_index_max then
                i = 0
            end
		end
	end
end

return GamblingBG