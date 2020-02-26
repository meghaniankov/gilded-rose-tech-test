require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      subject.update_quality(items)
      expect(items[0].name).to_not eq "fixme"
    end
  end

  describe '#update_backstage_passes' do

    it 'quality increases by 1 each day before 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
      subject.update_backstage_passes(item)
      expect(item.quality).to eq 11
    end

    it 'quality increases by 2 each day within 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
      subject.update_backstage_passes(item)
      expect(item.quality).to eq 12
    end

    it 'quality increases by 3 each day within 5 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
      subject.update_backstage_passes(item)
      expect(item.quality).to eq 13
    end

    it 'quality drops to 0 after the concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      subject.update_backstage_passes(item)
      expect(item.quality).to eq 0
    end

    it 'never updates the quality above 50' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)
      subject.update_backstage_passes(item)
      expect(item.quality).to eq 50
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
