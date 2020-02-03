player = {}

movementSpeed = 10

function SetupPlayer()
  player.x = 50
  player.y = 50
  player.h = 100
  player.w = 85
  player.image = images.player_down
  player.direction = "down"
end

function UpdatePlayerPosition()

  if love.keyboard.isDown("up") then
    player.direction = "up"
  elseif love.keyboard.isDown("down") then
    player.direction = "down"
  elseif love.keyboard.isDown("left") then
    player.direction = "left"
  elseif love.keyboard.isDown("right") then
    player.direction = "right"
  end

  if player.direction == "up" then
    if player.y > 0 then
      player.y = player.y - movementSpeed
    else
      player.y = windowMaxY
    end
    player.image = images.player_up
  end

  if player.direction == "down" then
    if player.y + player.h < windowMaxY then
      player.y = player.y + movementSpeed
    else
      player.y = 0
    end
    player.image = images.player_down
  end

  if player.direction == "left" then
    if player.x > 0 then
      player.x = player.x - movementSpeed
    else
      player.x = playingAreaMaxX
    end
    player.image = images.player_left
  end

  if player.direction == "right" then
    if player.x + player.w < playingAreaMaxX then
      player.x = player.x + movementSpeed
    else
      player.x = 0
    end
    player.image = images.player_right
  end

end
