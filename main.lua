require "player"

--we have removed the mouseclick function and replaced it with the player

function love.load()
  player.load()
  local img = love.graphics.newImage("index.jpg")
  
  pSystem = love.graphics.newParticleSystem(img, 32)
  pSystem:setParticleLifetime(1,5)
  pSystem:setLinearAcceleration(-20, -20, 20, 20)
  pSystem:setSpeed(50)
  pSystem:setSpin(20, 50)
end

function love.draw()
  --we now draw the particles to our player
  love.graphics.draw(pSystem, player.x, player.y)
  player.draw()
end

function love.update(dt)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end

  pSystem:update(dt)
  --this is where we update things from the player
  player.physics(dt)
  player.move(dt)
  player.collision(dt)
  player.emitP()
end