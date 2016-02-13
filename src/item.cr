class Item
  property name, sell_in, quality
  def initialize(@name, @sell_in, @quality)
  end

  def ==(other : Item)
    [self.name, self.sell_in, self.quality] ==
      [other.name, other.sell_in, other.quality]
  end
end

class Normal
  private getter item
  def initialize(@item)
  end

  def update
    item.sell_in -= 1
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0
    item.quality = 0 if item.quality < 0
  end
end

class Brie
  private getter item
  def initialize(@item)
  end

  def update
    item.sell_in -= 1
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
    item.quality = 50 if item.quality > 50
  end
end

class BackstagePass
  private getter item
  def initialize(@item)
  end

  def update
    item.sell_in -= 1
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.sell_in < 0
  end
end
