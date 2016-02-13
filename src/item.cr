class Item
  property name, sell_in, quality
  def initialize(@name, @sell_in, @quality)
  end

  def ==(other : Item)
    [self.name, self.sell_in, self.quality] ==
      [other.name, other.sell_in, other.quality]
  end

  def update
  end
end

class Normal < Item
  def update
    @sell_in -= 1
    @quality -= 1
    @quality -= 1 if @sell_in < 0
    @quality = 0 if @quality < 0
  end
end
