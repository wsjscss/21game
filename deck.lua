-- Колода карт
local Deck = {}

-- Создание таблицы с картами
function Deck:create()
  local obj = {}

  -- Методы
  function createShuffledCards()
  end
  function shuffleCards()
  end

  -- Возвращает одну карту из колоды и удаляет её из массива карт
  function getCard()
  end

  -- Создаем массив с цифрами по 4, пример {2,2,2,2, 3,3,3,3, 4,4,4,4 ... 11,11,11,11}
  obj.cards = createShuffledCards()

  -- Возвращаем инстанс
  setmetatable(obj, self)
  self.__index = self
  return obj
end

return Deck
