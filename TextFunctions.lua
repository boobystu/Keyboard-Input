questionY = 100
answerAY = 200
answerBY = 300
answerCY = 400

wrapPoint = 450

questions = {}

function string:split( inSplitPattern, outResults )
  if not outResults then
    outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  while theSplitStart do
    table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( self, theStart ) )
  return outResults
end

function PrintQuestionsAndAnswers()
  local allTextItems = questions[questionCounter]:split(",")
  q = allTextItems[1]
  a1 = allTextItems[2]
  a2 = allTextItems[3]
  a3 = allTextItems[4]
  ac = allTextItems[5]

  if a1 == ac then
    coinA.correctAnswer = true
  elseif a2 == ac then
    coinB.correctAnswer = true
  else
    coinC.correctAnswer = true
  end

  love.graphics.printf("Q:" .. q, questionAreaMinX, questionY, wrapPoint)
  love.graphics.printf("A:" .. a1, questionAreaMinX, answerAY, wrapPoint)
  love.graphics.printf("B:" .. a2, questionAreaMinX, answerBY, wrapPoint)
  love.graphics.printf("C:" .. a3, questionAreaMinX, answerCY, wrapPoint)
end

function ReadQuestionFile()
  local file = io.open("questions.txt", "r")

  for line in file:lines() do
    if line ~= "" then
      table.insert (questions, line)
    end
  end
  file:close()
end

function PrintScore()
  love.graphics.print("SCORE: " .. score, 10, 10)
end

function PrintTimer()

  love.graphics.print(string.format("Time: %.0f", os.clock()), 200, 10)
end

function NextQuestion()
  if questionCounter < #questions then
    questionCounter = questionCounter + 1
    PrintQuestionsAndAnswers()
  end
end
