class Item
  property name, sell_in, quality
  def initialize(@name, @sell_in, @quality)
  end

  def ==(other : Item)
    [self.name, self.sell_in, self.quality] ==
      [other.name, other.sell_in, other.quality]
  end
end
