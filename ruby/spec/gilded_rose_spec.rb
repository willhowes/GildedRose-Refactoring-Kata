require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    context 'Normal item' do

      before(:each) do
        @item = Item.new("normal", 10, 50)
      end

      it "does not change the name" do
        items = [@item]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "normal"
      end

      it "reduces sell_in by 1" do
        items = [@item]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end

      it "reduces quality by 1" do
        items = [@item]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 49
      end

      it "reduces quality by 2 when 0 days left" do
        items = [Item.new("normal", 0, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 48
      end
    end

    context 'Aged Brie item' do

      before(:each) do
        @aged_brie_item = Item.new("Aged Brie", 10, 20)
      end

      it 'increases Aged Brie quality by one' do
        items = [@aged_brie_item]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end

      it 'increases Aged Brie by 2 after sell_in date' do
        items = [Item.new("Aged Brie", 0, 20)]
        10.times { GildedRose.new(items).update_quality() }
        expect(items[0].quality).to eq 40
      end

      it 'cannot increase quality above 50' do
        items = [@aged_brie_item]
        100.times { GildedRose.new(items).update_quality() }
        expect(items[0].quality).to eq 50
      end
    end

    context 'Sulfuras items' do

      before(:each) do
        @sulfuras_item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      end

      it 'does not change Sulfuras quality' do
        items = [@sulfuras_item]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
      end

      it 'does not change Sulfuras sell_in date' do
        items = [@sulfuras_item]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
      end

    end
  end
end
