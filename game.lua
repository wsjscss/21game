local Deck = require "deck"
local Player = require "player"

-- Начало раунда
function startRound()
  -- ход БотА.
  local botAResult = loopMove(botA)

  -- Если кол-во очеков больше 21, проигрыш
  if botAResult > 21 then
    -- Показываем побеителя
    showWinner(botB)
    stopRound()
    return
  end

  -- ход БотB.
  local botBResult = loopMove(botB)

  -- Если кол-во очеков больше 21, проигрыш
  if botBResult > 21 then
    -- Показываем побеителя
    showWinner(botA)
    stopRound()
    return
  end

  -- Если у обоих ботов очки <=21 сравниваем у кого больше
  if botAResult > botBResult then
    showWinner(botA)
  else
    showWinner(botB)
  end

  stopRound()
end

-- Конец раунда. Сбрасываем игроков до дефолтных значений
function stopRound()
  botA:reset()
  botB:reset()
end

-- Показываем победителя
function showWinner(bot)
end

function loopMove(bot)
  while bot.isMoving == 1 do
    local card = deck.getCard()
    bot:addScore(card)

    -- Тут бот решает, надо ли ему брать ещё карту или нет
    bot:makeDecision()
  end

  return bot.currentScore
end

-- Создание колоды со случайным набором карт
local deck = Deck:create()
local botA = Player.create()
local botB = Player.create()
startRound()
