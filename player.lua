local Player = {}

function Player:create()
  local obj = {}

  -- Методы
  function obj:reset()
    obj.currentScore = 0
    obj.isMoving = 1
  end

  -- Добавляем очки
  function obj:addScore()
  end

  -- Принимаем решение брать ещё или остановится
  function obj:makeDecision()
    -- Тут случайным образом решается игрок играет дальше или останавливается
    -- Можно добавить какой-то процент рискованности игрока
    local decision = 0 -- или 1
    obj.isMoving = decision
  end

  -- Переменные
  -- Показывает сколько сейчас у игрока очков собранных карт
  obj.currentScore = 0
  -- Ходит ли игрок или остановился (берет ли он ещё карту)
  obj.isMoving = 1

  -- Возвращаем инстанс
  setmetatable(obj, self)
  self.__index = self
  return obj
end
