require 'spec_helper'
require 'conjured'

describe Conjured do
  let(:item) { Item.new('Conjured Mana Cake', 10, 100) }

  describe '#update' do
    it 'decreases quality at the end of each day' do
      subject.update(item)
      expect(item.quality).to eq 98
    end

    it 'decreases quality x2 after sell_in date has passed' do
      12.times { subject.update(item) }
      expect(item.quality).to eq 74
    end
  end

end
