require 'gilded_rose'

describe 'Gilded Rose Features' do

  it 'updates the sell_in date of item at the end of each day' do
    item = Item.new("foo", 5, 10)
    items = [item]
    gilded_rose = GildedRose.new(items)
    gilded_rose.update_quality()
    expect(item.sell_in).to eq 4
  end

  context 'for a regular item' do
    it 'updates the quality at the end of each day' do
      item = Item.new("foo", 5, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 9
    end
  end

  context 'for Aged Brie' do
    it 'updates the quality at the end of each day' do
      item = Item.new("Aged Brie", 5, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 11
    end
  end

  context 'for Sulfuras' do
    it 'never updates the quality' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 0, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 10
    end

    it 'does not have a sell_in date' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 0, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.sell_in).to eq 0
    end
  end

  context 'for Backstage Passes' do
    it 'quality increases normally each day before 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 11
    end

    it 'quality increases by 2 each day within 10 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 12
    end

    it 'quality increases by 3 each day within 5 days of concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 13
    end

    it 'quality set to 0 after concert' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
      items = [item]
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(item.quality).to eq 0
    end
  end



end