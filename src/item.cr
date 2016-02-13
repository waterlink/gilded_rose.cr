class Item
  property name, sell_in, quality
  def initialize(@name, @sell_in, @quality)
  end

  def ==(other : Item)
  end
end
