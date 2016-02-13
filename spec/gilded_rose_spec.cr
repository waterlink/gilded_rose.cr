require "./spec_helper"

describe GildedRose do
  it "does not fail" do
    GildedRose.new.update_quality
  end

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
end
