require "./spec_helper"

describe GildedRose do
  it "does not fail" do
    GildedRose.new.update_quality
  end

  it "does something to +5 Dexterity Vest" do
    item = Item.new("+5 Dexterity Vest", 10, 20)
    subject = GildedRose.new
    subject.items = [item]

    subject.update_quality

    item.name.should eq("+5 Dexterity Vest")
    item.sell_in.should eq(9)
    item.quality.should eq(19)
  end
end
