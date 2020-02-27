module BackstagePasses

  def self.update(item)
    update_quality(item)
    update_sell_in(item)
    item
  end

  private

  def self.update_quality(item)
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

  end

  def self.update_sell_in(item)
    item.sell_in -= 1
  end
end
