module Conjured

  def self.update(item)
    update_quality(item)
  end

  private

  def self.update_quality(item)
    item.quality -= 2
  end

end
