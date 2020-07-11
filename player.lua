local Player = {}

function Player.create(player_name)
  return {
    name = player_name,
    current_score = 0,
    is_moving = 1,
    won_rounds = 0
  }
end

-- Добавляем очки
function Player.add_score(player, score)
  return player.current_score + score
end

-- Принимаем решение брать ещё или остановится
function Player.make_decision(palyer)
  -- Тут случайным образом решается игрок играет дальше или останавливается
  -- Можно добавить какой-то процент рискованности игрока
  local decision = 0 -- или 1
  return decision
end

-- Добавляем +1 к выигранным уровням
function add_won_round(player)
  player.won_rounds = player.won_rounds + 1
end

return Player
