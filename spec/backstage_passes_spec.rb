require 'backstage_passes'

describe BackstagePasses do

  describe '#update' do
    it 'quality increases by 1 each day before 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
      subject.update(item)
      expect(item.quality).to eq 11
    end

    it 'quality increases by 2 each day within 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
      subject.update(item)
      expect(item.quality).to eq 12
    end

    it 'quality increases by 3 each day within 5 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
      subject.update(item)
      expect(item.quality).to eq 13
    end

    it 'quality drops to 0 after the concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      subject.update(item)
      expect(item.quality).to eq 0
    end

    it 'never updates the quality above 50' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)
      subject.update(item)
      expect(item.quality).to eq 50
    end

  end

end