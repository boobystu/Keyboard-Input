require "collision"
require "GraphicsFunctions"
require "TextFunctions"
require "Player"
require "Coins"
require "Sounds"

countdown = 4

totalGameTime = 60 + countdown

gameTimer = totalGameTime - os.clock()

gameOver = false

function love.load(arg)

  ReadQuestionFile()

  SetupGraphics()

  SetupPlayer()

  SetUpCoins()

  SetupSounds()

end

function love.update(dt)

  if gameTimer <= 0 then

    gameOver = true

  end

  if gameOver == true then

    return

  end

  if countdown <= 0 then

    UpdatePlayerPosition()

    CheckForCoinContact()

  end

end

function love.draw()

  if gameOver == true then

    PrintGameOver()

    return

  end

  DrawBackground()

  DrawPlayer()

  DrawCoins()

  if countdown <= 0 then

    PrintScore()

    PrintTimer()

    PrintQuestionsAndAnswers()
  else

    PrintCountdown()

  end

end
