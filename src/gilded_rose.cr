require "./item"

class GildedRose
  # TODO: remove, when not required for testability
  property items

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
      update_item(item)
    end
  end

  private def update_item(item)
    item_updater(item).update
  end

  private def item_updater(item)
    case
    when item.name.match(/Brie/)
      Brie.new(item)

    when item.name.match(/Backstage passes/)
      BackstagePass.new(item)

    when item.name.match(/Sulfuras/)
      Sulfuras.new(item)

    else
      Normal.new(item)
    end
  end
end
