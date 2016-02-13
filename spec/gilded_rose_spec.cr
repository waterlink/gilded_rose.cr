require "./spec_helper"

describe GildedRose do
  it "decreases sell_in and quality of +5 Dexterity Vest" do
    item = Item.new("+5 Dexterity Vest", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(9)
    item.quality.should eq(19)
  end

  it "does not change quality when Dexterity Vest has quality <= 0" do
    item = Item.new("+5 Dexterity Vest", 10, 0)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(9)
    item.quality.should eq(0)
  end

  it "reduces quality at a 2x speed when Dexterity Vest has sell_in <= 0" do
    item = Item.new("+5 Dexterity Vest", 0, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(-1)
    item.quality.should eq(18)
  end

  it "reduces only sell_in when Dexterity Vest has sell_in <= 0 and quality <= 0" do
    item = Item.new("+5 Dexterity Vest", 0, 0)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(-1)
    item.quality.should eq(0)
  end

  it "increases quality by one and decreases sell_in when it is Aged Brie" do
    item = Item.new("Aged Brie", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Aged Brie")
    item.sell_in.should eq(9)
    item.quality.should eq(21)
  end

  it "decreases only sell_in when it is Aged Brie with maximum quality" do
    item = Item.new("Aged Brie", 10, 50)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Aged Brie")
    item.sell_in.should eq(9)
    item.quality.should eq(50)
  end

  it "increases quality by two and decreases sell_in when it is Aged Brie when sell_in is negative" do
    item = Item.new("Aged Brie", -1, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Aged Brie")
    item.sell_in.should eq(-2)
    item.quality.should eq(22)
  end

  it "does not change when it is Sulfuras" do
    item = Item.new("Sulfuras, Hand of Ragnaros", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Sulfuras, Hand of Ragnaros")
    item.sell_in.should eq(10)
    item.quality.should eq(20)
  end

  it "does not change when it is Sulfuras with negative sell_in" do
    item = Item.new("Sulfuras, Hand of Ragnaros", -5, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Sulfuras, Hand of Ragnaros")
    item.sell_in.should eq(-5)
    item.quality.should eq(20)
  end

  it "increases quality and decreases sell_in when it is Backstage passes" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Backstage passes to a TAFKAL80ETC concert")
    item.sell_in.should eq(19)
    item.quality.should eq(21)
  end

  it "does not increase quality when it is Backstage passes of highest quality" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 50)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Backstage passes to a TAFKAL80ETC concert")
    item.sell_in.should eq(19)
    item.quality.should eq(50)
  end

  it "increases quality twice when it is Backstage passes with low sell_in" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Backstage passes to a TAFKAL80ETC concert")
    item.sell_in.should eq(9)
    item.quality.should eq(22)
  end

  it "increases quality thrice when it is Backstage passes with lowest sell_in" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Backstage passes to a TAFKAL80ETC concert")
    item.sell_in.should eq(3)
    item.quality.should eq(23)
  end

  it "loses quality when it is Backstage passes with negative sell_in" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Backstage passes to a TAFKAL80ETC concert")
    item.sell_in.should eq(-3)
    item.quality.should eq(0)
  end

  pending "decreases sell_in and decreases quality x2 of Conjured item" do
    item = Item.new("Conjured Mana Cake", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Conjured Mana Cake")
    item.sell_in.should eq(9)
    item.quality.should eq(18)
  end

  it "does not change quality when Conjured item has quality <= 0" do
    item = Item.new("Conjured Mana Cake", 10, 0)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Conjured Mana Cake")
    item.sell_in.should eq(9)
    item.quality.should eq(0)
  end

  pending "reduces quality at a 4x speed when Conjured item has sell_in <= 0" do
    item = Item.new("Conjured Mana Cake", 0, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Conjured Mana Cake")
    item.sell_in.should eq(-1)
    item.quality.should eq(16)
  end

  it "reduces only sell_in when Conjured item has sell_in <= 0 and quality <= 0" do
    item = Item.new("Conjured Mana Cake", 0, 0)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("Conjured Mana Cake")
    item.sell_in.should eq(-1)
    item.quality.should eq(0)
  end

  it "works with the array correctly" do
    vest = Item.new("+5 Dexterity Vest", 10, 20)
    sulf = Item.new("Sulfuras, Hand of Ragnaros", 10, 20)
    pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 20)

    subject = GildedRose.new
    subject.items = [vest, sulf, pass]

    subject.update_quality

    subject.items.should eq([
      Item.new("+5 Dexterity Vest", 9, 19),
      Item.new("Sulfuras, Hand of Ragnaros", 10, 20),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 23),
    ])
  end
end
