require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      subject.update_quality(items)
      expect(items[0].name).to_not eq "fixme"
    end
  end

  describe '#update_other' do
    it 'decreases quality at the end of each day' do
      item = Item.new("foo", 5, 10)
      subject.update_other(item)
      expect(item.quality).to eq 9
    end

    it 'decreases quality x2 after sell_in date has passed' do
      item = Item.new("foo", -1, 10)
      subject.update_other(item)
      expect(item.quality).to eq 8
    end

    it 'never has a negative quality' do
      item = Item.new("foo", 5, 0)
      subject.update_other(item)
      expect(item.quality).to eq 0
    end
  end

  describe '#update_sell_in' do
    it 'decreases at the end of each day' do
      item = Item.new("foo", 5, 10)
      subject.update_sell_in(item)
      expect(item.sell_in).to eq 4
    end
  end

end
