local IntroWarpBin, super = Class(Event)

function IntroWarpBin:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self.solid = true

    self.properties = data.properties or {}

    self.sprite_a = Sprite("world/events/shortcut_light")
    self.sprite_a:setScale(2.75, -2)
    self.sprite_a.debug_select = false

    self.sprite_a:play(1/6, true)
    self:addChild(self.sprite_a)
end

function IntroWarpBin:update()
    super.update(self)
    local player = Game.world.player
    local event = self
    local distance = Utils.dist(player.x, player.y, event.x, event.y)
    local alpha = Utils.clampMap(distance, 80, 130, 1, 0)
    self.sprite_a.alpha = alpha
end
function IntroWarpBin:onInteract()
    Game.world:startCutscene("warp_bin", self)
end

return IntroWarpBin