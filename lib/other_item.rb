module OtherItem

  def self.update(item)
    update_sell_in(item)
    update_quality(item)
    item
  end

  private

  def self.update_quality(item)
    return item.quality if item.quality == 0

    if item.sell_in < 0

      item.quality -= 2
    else
      item.quality -= 1
    end
  end

  def self.update_sell_in(item)
    item.sell_in -= 1
  end

end