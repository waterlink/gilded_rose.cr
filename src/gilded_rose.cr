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

  def update_normal(item)
    item.sell_in -= 1
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0
    item.quality = 0 if item.quality < 0
  end

  def update_brie(item)
    item.sell_in -= 1
    item.quality += 1
    item.quality += 1 if item.sell_in < 0
    item.quality = 50 if item.quality > 50
  end

  def update_backstage_pass(item)
    item.sell_in -= 1
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.sell_in < 0
  end

  def update_sulfuras(item)
  end

  def update_quality
    @items.each do |item|
      if item.name.match(/Brie/)
        update_brie(item)
        next
      end

      if item.name.starts_with?("Backstage passes")
        update_backstage_pass(item)
        next
      end

      if item.name.starts_with?("Sulfuras")
        update_sulfuras(item)
        next
      end

      update_normal(item)
    end
  end
end
