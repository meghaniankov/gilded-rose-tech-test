require 'spec_helper'
require 'conjured'

describe Conjured do
  let(:item) { Item.new('Conjured Mana Cake', 10, 100) }

  describe '#update' do
    it 'decreases quality at the end of each day' do
      subject.update(item)
      expect(item.quality).to eq 98
    end
  end

end
