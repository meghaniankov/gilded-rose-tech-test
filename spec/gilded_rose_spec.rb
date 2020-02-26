require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      subject.update_quality(items)
      expect(items[0].name).to_not eq "fixme"
    end
  end

  describe '#update_aged_brie' do
    before do
      @item = Item.new("Aged Brie", 0, 0)
      subject.update_aged_brie(@item)
    end

    it 'increases the quality at the end of each day' do
      expect(@item.quality).to eq 1
    end

    it 'never increases the quality over 50' do
      51.times { subject.update_aged_brie(@item) }
      expect(@item.quality).to eq 50
    end
  end

  describe '#update_sulfuras' do
    before do
      @item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
      subject.update_sulfuras(@item)
    end

    it 'never updates the quality' do
      expect(@item.quality).to eq 10
    end

    it 'never updates the sell_in' do
      expect(@item.sell_in).to eq 10
    end
  end
  

end