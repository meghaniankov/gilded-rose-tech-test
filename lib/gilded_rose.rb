require 'aged_brie'
class GildedRose

  def update_quality(items)
    items.each do |item|
      update_aged_brie(item) if item.name == 'Aged Brie'
      update_backstage_passes(item) if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      update_sulfuras(item) if item.name == 'Sulfuras, Hand of Ragnaros'
      update_other(item) if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros'
    end
  end

  def update_aged_brie(item)
    item.quality < 50 ? item.quality += 1 : item.quality
    update_sell_in(item)
  end

  def update_sulfuras(item)
    item
  end

  def update_backstage_passes(item)
    return item.quality if item.quality == 50

    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <= 10
      item.quality += 2
    elsif item.sell_in > 10
      item.quality += 1
    end

    update_sell_in(item)
  end

  def update_other(item)
    return item.quality if item.quality == 0

    if item.sell_in < 0
      item.quality -= 2
    else
      item.quality -= 1
    end

    update_sell_in(item)
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

  ITEM_TYPES = { 'Aged Brie' => AgedBrie }

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