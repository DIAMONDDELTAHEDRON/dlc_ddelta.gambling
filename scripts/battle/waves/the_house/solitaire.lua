local Solitaire, super = Class(Wave)

function Solitaire:onStart()
    -- Every 0.33 seconds...
    self.timer:every(1, function()
        -- Our X position is offscreen, to the right
        local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena.top-50

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local dir = Utils.sign(Game.battle.arena.x - x)
        local bullet = self:spawnBullet("the_house/solitaire_card", x, y, Utils.random(2,4)*dir)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = true
    end)
end

function Solitaire:update()
    -- Code here gets called every frame

    super.update(self)
end

return Solitaire