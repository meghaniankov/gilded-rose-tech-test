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
      @item = Item.new("Aged Brie", 0, 10)
      subject.update_aged_brie(@item)
    end

    it 'increases the quality at the end of each day' do
      expect(@item.quality).to eq 11
    end
  end
  

end
