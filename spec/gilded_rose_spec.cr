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

  it "... when Dexterity Vest has quality == 0" do
    item = Item.new("+5 Dexterity Vest", 10, 0)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(9)
    item.quality.should eq(0)
  end
end
