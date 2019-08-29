require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "reduces sell_in by 1" do
      items = [Item.new("Normal Item", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "reduces quality by 1" do
      items = [Item.new("Normal Item", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 49
    end

    it "reduces quality by 2 when 0 days left" do
      items = [Item.new("Normal Item", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 48
    end

    it 'increases Aged Brie quality by one' do
      items = [Item.new("Aged Brie", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 21
    end

    it 'increases Aged Brie by 2 after sell_in date' do
      items = [Item.new("Aged Brie", 0, 20)]
      10.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 40
    end

    it 'cannot increase quality above 50' do
      items = [Item.new("Aged Brie", 0, 20)]
      100.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 50
    end

  end

end
