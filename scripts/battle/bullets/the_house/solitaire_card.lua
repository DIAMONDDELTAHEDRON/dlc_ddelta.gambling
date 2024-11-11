local SolitaireCard, super = Class(Bullet)

function SolitaireCard:init(x, y, speed, trail_size)
    super.init(self, x, y, "battle/bullets/the_house/solitaire_card")
    self.texture = Assets.getTexture("battle/bullets/the_house/solitaire_card")
    self.trail_size = trail_size or 20
    self.trail_width = self.width
    self.trail_height = self.height
    self.trail_x = {}
    self.trail_y = {}
    self.trail_colliders = {}
    for i=1,self.trail_size do
        self.trail_x[i] = self.x
        self.trail_y[i] = self.y
    end
    self:setHitboxes()
    self.collider = ColliderGroup(self, self.trail_colliders)
    self.physics.speed_x = speed
    self.physics.gravity = 0.4
    self.fps_timer = 0
    self.bounced = false
end

function SolitaireCard:update()
    super.update(self)
    if self.bounced == false then
        if self.y + self.physics.speed_y >= Game.battle.arena.bottom - 32 then
            self.bounced = true
            self.physics.speed_y = self.physics.speed_y * -0.6
            self.y = Game.battle.arena.bottom - 32 - self.physics.speed_y
        end
    end
    self.fps_timer = self.fps_timer + DTMULT
    if self.fps_timer >= 1 then
        for i=self.trail_size,1,-1 do
            self.trail_x[i] = self.trail_x[i-1]
            self.trail_y[i] = self.trail_y[i-1]
        end
        self.trail_x[1] = self.x
        self.trail_y[1] = self.y
        self:setHitboxes()
        self.fps_timer = 0
    end
end

function SolitaireCard:setHitboxes()
    for i=1,self.trail_size do
        local x, y = self:screenToLocalPos(self.trail_x[i], self.trail_y[i])
        self.trail_colliders[i] = Hitbox(self, x-6, y-12, 12, 24)
    end
end

function SolitaireCard:draw()
    for i=self.trail_size,1,-1 do
        local x, y = self:screenToLocalPos(self.trail_x[i]-20, self.trail_y[i]-32)
        Draw.draw(self.texture, x, y)
    end
    super.draw(self)
end
return SolitaireCard