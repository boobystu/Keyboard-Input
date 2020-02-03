require "collision"
require "GraphicsFunctions"
require "TextFunctions"
require "Player"
require "Coins"

  function love.load(arg)
    math.randomseed(os.time())

    ReadQuestionFile()

    SetupGraphicsImages()

    SetupPlayer()

    playingAreaMaxX = 800
    windowMaxX = 1400

    windowMaxY = 600

    questionAreaMinX = playingAreaMaxX + images.background:getWidth()
    questionAreaMaxX = windowMaxX

    SetUpCoins()

    questionCounter = 1

    score = 0

    love.window.setMode(windowMaxX, windowMaxY)

    sounds = {}
    sounds.coin = love.audio.newSource("assets/coin.ogg", "static")

    fonts = {}
    fonts.large = love.graphics.newFont("assets/gamer.ttf", 36)

  end

  function love.update(dt)

    movementSpeed = 10

    if love.keyboard.isDown("up") then
      if player.y > 0 then
        player.y = player.y - movementSpeed
      else
        player.y = 600
      end
      player.image = images.player_up
    end

    if love.keyboard.isDown("down") then
      if player.y + player.h < 600 then
        player.y = player.y + movementSpeed
      else
        player.y = 0
      end
      player.image = images.player_down
    end

    if love.keyboard.isDown("left") then
      if player.x > 0 then
        player.x = player.x - movementSpeed
      else
        player.x = 800
      end
      player.image = images.player_left
    end

    if love.keyboard.isDown("right") then
      if player.x + player.w < 800 then
        player.x = player.x + movementSpeed
      else
        player.x = 0
      end
      player.image = images.player_right
    end

    CheckForCoinContact()

  end

  function love.draw()

    love.graphics.setFont(fonts.large)

    --draw background
    for x=0, playingAreaMaxX, images.background:getWidth() do
      for y=0, love.graphics.getHeight(), images.background:getHeight() do
        love.graphics.draw(images.background, x, y)
      end
    end

    love.graphics.draw(player.image, player.x, player.y)

    DrawCoins()

    PrintScore()

    PrintTimer()

    PrintQuestionsAndAnswers()

  end
