require 'spec_helper'
require 'other_item'

describe OtherItem do
  let(:item) { Item.new('foo', 10, 100) }

  describe '#update' do
    it 'decreases quality at the end of each day' do
      subject.update(item)
      expect(item.quality).to eq 99
    end

    it 'decreases quality x2 after sell_in date has passed' do
      11.times { subject.update(item) }
      expect(item.quality).to eq 88
    end

    it 'never has a negative quality' do
      item = Item.new("foo", 5, 0)
      subject.update(item)
      expect(item.quality).to eq 0
    end

    it 'returns the item' do
      expect(subject.update(item)).to eq item
    end
  end

end
