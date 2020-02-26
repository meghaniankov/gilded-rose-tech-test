require 'aged_brie'

describe AgedBrie do
  let(:item) { Item.new('Aged Brie', 10, 10) }

  describe '#update' do
    it 'increases the quality' do
      subject.update(item)
      expect(item.quality).to eq 11
    end

    it 'decreases the sell_in' do
      subject.update(item)
      expect(item.sell_in).to eq 9
    end

    it 'returns the item' do
      expect(subject.update(item)).to eq item
    end
  end

end