require "Coins"
require "TextFunctions"

images = {}

playingAreaMaxX = 0
windowMaxX = 0
windowMaxY = 0
questionAreaMinX = 0
questionAreaMaxX = 0

function SetupGraphics()

  images.background = love.graphics.newImage("assets/ground.png")
  images.player_down = love.graphics.newImage("assets/player_down.png")
  images.player_up = love.graphics.newImage("assets/player_up.png")
  images.player_left = love.graphics.newImage("assets/player_left.png")
  images.player_right = love.graphics.newImage("assets/player_right.png")

  SetupWindow()

end

function DrawCoins()
  --draw questions
  for i=1, #coins, 1 do
    local coin = coins[i]
    love.graphics.draw(coin.coinImage, coin.x, coin.y)
  end
end

function DrawBackground()
  for x=0, playingAreaMaxX, images.background:getWidth() do
    for y=0, love.graphics.getHeight(), images.background:getHeight() do
      love.graphics.draw(images.background, x, y)
    end
  end
end

function DrawPlayer()
  love.graphics.draw(player.image, player.x, player.y)
end

function SetupWindow()

  playingAreaMaxX = 800
  windowMaxX = 1400
  windowMaxY = 600
  questionAreaMinX = playingAreaMaxX + images.background:getWidth()
  questionAreaMaxX = windowMaxX

  love.window.setMode(windowMaxX, windowMaxY)

end
