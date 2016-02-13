require "./item"

class GildedRose
  DEFAULT_ITEMS = [
    Item.new("+5 Dexterity Vest", 10, 20),
    Item.new("Aged Brie", 2, 0),
    Item.new("Elixir of the Mongoose", 5, 7),
    Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
    Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    Item.new("Conjured Mana Cake", 3, 6),
  ]

  protected getter items
  private getter updater
  def initialize(items=nil, @updater=ItemUpdater)
    if items
      @items = items
      return
    end

    @items = DEFAULT_ITEMS
  end

  def ==(other : GildedRose)
    self.items == other.items
  end

  def update_quality
    items.each do |item|
      updater.new(item).update
    end
  end
end
