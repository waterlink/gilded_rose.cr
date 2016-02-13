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

  def update_quality

    (0..(@items.size-1)).each do |i| # OK

      item = @items[i]
      if item.name != "Aged Brie" && !item.name.starts_with?("Backstage passes") && !item.name.starts_with?("Sulfuras")
        update_normal(item)
        next
      end

      if (@items[i].name != "Aged Brie" && @items[i].name != "Backstage passes to a TAFKAL80ETC concert") # OK
        if (@items[i].quality > 0) # OK
          if (@items[i].name != "Sulfuras, Hand of Ragnaros") # OK
            @items[i].quality = @items[i].quality - 1 # OK
          end
        end
      else # OK
        if (@items[i].quality < 50) # OK
          @items[i].quality = @items[i].quality + 1 # OK
          if (@items[i].name == "Backstage passes to a TAFKAL80ETC concert") # OK
            if (@items[i].sell_in < 11) # OK
              if (@items[i].quality < 50) # OK
                @items[i].quality = @items[i].quality + 1 # OK
              end
            end
            if (@items[i].sell_in < 6) # OK
              if (@items[i].quality < 50) # OK
                @items[i].quality = @items[i].quality + 1 # OK
              end
            end
          end
        end
      end

      if (@items[i].name != "Sulfuras, Hand of Ragnaros") # OK
        @items[i].sell_in = @items[i].sell_in - 1 # OK
      end

      if (@items[i].sell_in < 0) # OK
        if (@items[i].name != "Aged Brie") # OK
          if (@items[i].name != "Backstage passes to a TAFKAL80ETC concert") # OK
            if (@items[i].quality > 0) # OK
              if (@items[i].name != "Sulfuras, Hand of Ragnaros") # OK
                @items[i].quality = @items[i].quality - 1 # OK
              end
            end
          else # OK
            @items[i].quality = @items[i].quality - @items[i].quality # OK
          end
        else # OK
          if (@items[i].quality < 50) # OK
            @items[i].quality = @items[i].quality + 1 # OK
          end
        end
      end

    end
  end
end
