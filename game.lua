local Deck = require "deck"
local Player = require "player"

-- Начало раунда
function start_round()
  -- ход БотА.
  local botA_result = loop_move(botA)

  -- Если кол-во очеков больше 21, проигрыш
  if botA_result > 21 then
    -- Показываем побеителя
    show_winner(botB)
    return
  end

  -- ход БотB.
  local botB_result = loop_move(botB)

  -- Если кол-во очеков больше 21, проигрыш
  if botB_result > 21 then
    -- Показываем побеителя
    show_winner(botA)
    return
  end

  -- Если у обоих ботов очки <=21 сравниваем у кого больше
  if botA_result > botB_result then
    show_winner(botA)
  else
    show_winner(botB)
  end
end

-- Показываем победителя и добавляем ему очки
function show_winner(bot)
  Player.add_won_round(bot)
end

function loop_move(bot)
  --[[
    Тут запускается цикл в котром 
    1. игрок берёт одну карту
    2. добавляется очки
    3. игрок решает брать ещё или нет.
    
    Цикл крутится до тех пор пока 
    1. Игрок сам не решит что ему хватит
    2. Игрок набрал меньше 19 очков (Если набрал 19, то может решить взять ещё одну карту и ему может выпасть двойка)
  --]]
  while bot.is_moving == 1 and bot.current_score < 19 do
    local card = Deck.get_card(deck)
    Player.add_score(bot, card)

    -- Тут бот решает, надо ли ему брать ещё карту или нет
    Player.make_decision(bot)
  end

  return bot.current_score
end

-- Создание колоды со случайным набором карт
local deck = Deck.create()

-- Создание игроков
local botA = Player.create("Bot A")
local botB = Player.create("Bot B")

-- Запуск раунда
start_round()
