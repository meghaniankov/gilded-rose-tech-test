module Conjured

  def self.update(item)
    update_quality(item)
    update_sell_in(item)
  end

  private

  def self.update_quality(item)
    return item.quality if item.quality.zero?

    item.sell_in.negative? ? item.quality -= 4 : item.quality -= 2
  end

  def self.update_sell_in(item)
    item.sell_in -= 1
  end

end
