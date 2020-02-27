require 'aged_brie'
require 'sulfuras'

class GildedRose

  def update_quality(items)
    items.each do |item|
      AgedBrie.update(item) if item.name == 'Aged Brie'
      Sulfuras.update(item) if item.name == 'Sulfuras, Hand of Ragnaros'
      BackstagePasses.update(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      OtherItem.update(item) if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros'
    end
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end