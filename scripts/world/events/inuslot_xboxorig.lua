local InuSlotXbox, super = Class(Event)
function InuSlotXbox:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setOrigin(0.5, 1)
    self:setSprite("world/events/inuslot/inuslot_xboxorig")
end
return InuSlotXbox