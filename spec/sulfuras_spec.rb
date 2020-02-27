require 'spec_helper'
require 'sulfuras'

describe Sulfuras do

  let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 10, 10) }

  describe '#update' do
    it 'never updates the quality' do
      subject.update(item)
      expect(item.quality).to eq 10
    end

    it 'never updates the sell_in' do
      subject.update(item)
      expect(item.sell_in).to eq 10
    end

    it 'returns the item' do
      expect(subject.update(item)).to eq item
    end
  end

end
