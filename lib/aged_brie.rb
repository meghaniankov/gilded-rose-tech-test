module AgedBrie

  def self.update(item)
    update_quality(item)
    update_sell_in(item)
    item
  end

  private

  def self.update_quality(item)
    item.quality < 50 ? item.quality += 1 : item.quality
  end

  def self.update_sell_in(item)
    item.sell_in -= 1
  end

end