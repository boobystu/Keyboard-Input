coins = {}

coinHeight = 56
coinWidth = 56

coinA = {}
coinA.h = coinHeight
coinA.w = coinWidth
coinA.correctAnswer = false
coinA.coinImage = love.graphics.newImage("assets/coinA.png")

coinB = {}
coinB.h = coinHeight
coinB.w = coinWidth
coinB.correctAnswer = false
coinB.coinImage = love.graphics.newImage("assets/coinB.png")

coinC = {}
coinC.h = coinHeight
coinC.w = coinWidth
coinC.correctAnswer = false
coinC.coinImage = love.graphics.newImage("assets/coinC.png")

function SetUpCoins()
  coins = {}

  ResetCoinAnswerFlags()

  SetCoinPosition(coinA)
  SetCoinPosition(coinB)
  SetCoinPosition(coinC)

  table.insert(coins, coinA)
  table.insert(coins, coinB)
  table.insert(coins, coinC)
end

function CheckForCoinContact()
  for i=#coins, 1, -1 do
    local coin = coins[i]
    if AABB(player.x, player.y, player.w, player.h, coin.x, coin.y, coin.w, coin.h) then
      if coin.correctAnswer == true then
        score = score + 1
        sounds.coin:play()
        SetUpCoins()
        NextQuestion()
      else
        table.remove(coins, i)
        score = score - 1
      end
    end
  end
end

function SetCoinPosition(coin)
  local acceptableGap = 100
  repeat
    coin.x = math.random(0, playingAreaMaxX - coinWidth)
  until coin.x < player.x - acceptableGap or coin.x > player.x + acceptableGap

  repeat
    coin.y = math.random(0, windowMaxY - coinHeight)
  until coin.y < player.y - acceptableGap or coin.y > player.y + acceptableGap

end

function ResetCoinAnswerFlags()
  coinA.correctAnswer = false
  coinB.correctAnswer = false
  coinC.correctAnswer = false
end
