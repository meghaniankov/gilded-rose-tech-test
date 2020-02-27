require 'aged_brie'
require 'sulfuras'
require 'backstage_passes'
require 'conjured'

class GildedRose

  def update_quality(items)
    items.each do |item|
      special_item = ITEM_TYPES[item.name]
      special_item != nil ? special_item.update(item) : OtherItem.update(item)
    end
  end

  private

  ITEM_TYPES = { 'Aged Brie' => AgedBrie, 
                 'Sulfuras, Hand of Ragnaros' => Sulfuras,
                 'Backstage passes to a TAFKAL80ETC concert' => BackstagePasses,
                 'Conjured Mana Cake' => Conjured
  }
  
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
