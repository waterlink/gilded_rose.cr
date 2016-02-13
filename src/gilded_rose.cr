require "./item"

class GildedRose
  # TODO: remove, when not required for testability
  property items

  UPDATERS = {
    /Brie/ => Brie,
    /Backstage passes/ => BackstagePass,
    /Sulfuras/ => Sulfuras,
  }
  DEFAULT_UPDATER = Normal

  def initialize
    @items = [] of Item
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality
    @items.each do |item|
      item_updater(item).update
    end
  end

  private def item_updater(item)
    factory = UPDATERS
      .to_a
      .find { |x| item.name.match(x.first) }

    (factory || {nil, DEFAULT_UPDATER})[1]
      .new(item)
  end
end
