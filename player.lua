--this is our player and if you look at the botten you can see where the particles are emitted

player = {}

--this is where we set atributes of the player
function player.load()
  player.x = 10
  player.y = 10
  player.width = 10
  player.height = 10
  player.xvel = 0
  player.yvel = 0
  player.friction = 1
  player.speed = 500
end

--this is where the player is drawn from
function player.draw()
  love.graphics.setColor(255,0,0)
  love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)

end

--this is where the physics are handled
function player.physics(dt)
  player.x = player.x + player.xvel * dt
  player.y = player.y + player.yvel * dt
  player.xvel = player.xvel * (1 - math.min(dt*player.friction, 1))
  player.yvel = player.yvel * (1 - math.min(dt*player.friction, 1))
end

--this is where the movement is handled
function player.move(dt)
  if love.keyboard.isDown("right") and
  player.xvel < player.speed then
    player.xvel = player.xvel + player.speed * dt
  end

  if love.keyboard.isDown("left") and
  player.xvel > -player.speed then
    player.xvel = player.xvel - player.speed * dt
  end

  if love.keyboard.isDown("down") and
  player.yvel < player.speed then
    player.yvel = player.yvel + player.speed * dt
  end

  if love.keyboard.isDown("up") and
  player.yvel > -player.speed then
    player.yvel = player.yvel - player.speed * dt
  end
end

function player.collision(dt)
  if player.x < 0 then
    player.x = 0
    player.xvel = 0
  end

  if player.y < 0 then
    player.y = 0
    player.yvel = 0
  end

  if player.x + player.width > love.graphics.getWidth() then
    player.x = love.graphics.getWidth() - player.width
    player.xvel = 0
  end

  if player.y + player.height > love.graphics.getHeight() then
    player.y = love.graphics.getHeight() - player.height
    player.yvel = 0
  end
end    

--this is the function that emits the particles
--the rest above this is just for player movement and collision with the walls
function player.emitP()
  if player.x == 0 then
    pSystem:emit(30)
  end
end
