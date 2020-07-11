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
  --[[
    Тут запускается цикл в котром 
    1. игрок берёт одну карту
    2. добавляется очки
    3. игрок решает брать ещё или нет.
    
    Цикл крутится до тех пор пока 
    1. Игрок сам не решит что ему хватит
    2. Игрок набрал меньше 19 очков (Если набрал 19, то может решить взять ещё одну карту и ему может выпасть двойка)
  --]]
  while bot.isMoving == 1 and bot.currentScore < 19 do
    local card = deck.getCard()
    bot:addScore(card)

    -- Тут бот решает, надо ли ему брать ещё карту или нет
    bot:makeDecision()
  end

  return bot.currentScore
end

-- Создание колоды со случайным набором карт
local deck = Deck:create()

-- Создание игроков
local botA = Player.create()
local botB = Player.create()

-- Запуск раунда
startRound()
