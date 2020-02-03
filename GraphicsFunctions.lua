require "Coins"

images = {}

function SetupGraphicsImages()

  images.background = love.graphics.newImage("assets/ground.png")
  images.player_down = love.graphics.newImage("assets/player_down.png")
  images.player_up = love.graphics.newImage("assets/player_up.png")
  images.player_left = love.graphics.newImage("assets/player_left.png")
  images.player_right = love.graphics.newImage("assets/player_right.png")

end

function DrawCoins()
  --draw questions
  for i=1, #coins, 1 do
    local coin = coins[i]
    love.graphics.draw(coin.coinImage, coin.x, coin.y)
  end
end
