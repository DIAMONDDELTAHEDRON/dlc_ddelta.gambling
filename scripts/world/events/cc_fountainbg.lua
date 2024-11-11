local CCFountain, super = Class(Event)
function CCFountain:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 1)
    self:setSprite("world/bg/cc_fountainbg", 0.4)
end
return CCFountain