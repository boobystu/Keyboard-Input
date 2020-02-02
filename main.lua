require "collision"

  function love.load(arg)
    math.randomseed(os.time())

    score = 0



    coins = {}

    sounds = {}
    sounds.coin = love.audio.newSource("assets/coin.ogg", "static")

    fonts = {}
    fonts.large = love.graphics.newFont("assets/gamer.ttf", 36)

    images = {}
    images.background = love.graphics.newImage("assets/ground.png")
    images.coin = love.graphics.newImage("assets/coin.png")
    images.player_down = love.graphics.newImage("assets/player_down.png")
    images.player_up = love.graphics.newImage("assets/player_up.png")
    images.player_left = love.graphics.newImage("assets/player_left.png")
    images.player_right = love.graphics.newImage("assets/player_right.png") 

    player = {}
    player.x = 50
    player.y = 50
    player.h = 100
    player.w = 85
    player.image = images.player_down
  end

  function love.update(dt)
    movementSpeed = 10

    if love.keyboard.isDown("up") then
      if player.y > 0 then
        player.y = player.y - movementSpeed
      end
      player.image = images.player_up
    end

    if love.keyboard.isDown("down") then
      if player.y + player.h < 600 then
        player.y = player.y + movementSpeed
      end
      player.image = images.player_down
    end

    if love.keyboard.isDown("left") then
      if player.x > 0 then
        player.x = player.x - movementSpeed
      end
      player.image = images.player_left
    end

    if love.keyboard.isDown("right") then
      if player.x + player.w < 800 then
        player.x = player.x + movementSpeed
      end
      player.image = images.player_right
    end

    for i=#coins, 1, -1 do
      local coin = coins[i]
      if AABB(player.x, player.y, player.w, player.h, coin.x, coin.y, coin.w, coin.h) then
        table.remove(coins, i)
        score = score + 1
        sounds.coin:play()
      end
    end

    if math.random() < 0.01 then
      local coin = {}
      coin.h = 56
      coin.w = 56
      coin.x = math.random(0, 800 - coin.w)
      coin.y = math.random(0, 600 - coin.h)
      table.insert(coins, coin)
    end
  end

  function love.draw()

    for x=0, love.graphics.getWidth(), images.background:getWidth() do
      for y=0, love.graphics.getHeight(), images.background:getHeight() do
        love.graphics.draw(images.background, x, y)
      end
    end

    love.graphics.draw(player.image, player.x, player.y)

    for i=1, #coins, 1 do
      local coin = coins[i]
      --love.graphics.rectangle("fill", coin.x, coin.y, coin.w, coin.h)
      love.graphics.draw(images.coin, coin.x, coin.y)
    end

    love.graphics.setFont(fonts.large)
    love.graphics.print("SCORE: " .. score, 10, 10)

  end
