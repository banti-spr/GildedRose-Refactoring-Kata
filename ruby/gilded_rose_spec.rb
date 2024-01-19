require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

RSpec.describe GildedRose do
  describe '#update_quality' do
    it 'updates the quality of Aged Brie correctly' do
      aged_brie = Item.new('Aged Brie', 5, 30)
      gilded_rose = GildedRose.new([aged_brie])

      gilded_rose.update_quality(1)

      expect(aged_brie.quality).to eq(31)
      expect(aged_brie.sell_in).to eq(4)
    end

    it 'updates the quality of Backstage passes correctly' do
      backstage_pass = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20)
      gilded_rose = GildedRose.new([backstage_pass])

      gilded_rose.update_quality(5)

      expect(backstage_pass.quality).to eq(23)
      expect(backstage_pass.sell_in).to eq(9)
    end

    it 'updates the quality of Sulfuras correctly' do
      sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
      gilded_rose = GildedRose.new([sulfuras])

      gilded_rose.update_quality(1)

      expect(sulfuras.quality).to eq(80)
      expect(sulfuras.sell_in).to eq(0)
    end

    it 'updates the quality of Conjured Mana Cake correctly' do
      conjured_item = Item.new('Conjured Mana Cake', 3, 15)
      gilded_rose = GildedRose.new([conjured_item])

      gilded_rose.update_quality(1)

      expect(conjured_item.quality).to eq(13)
      expect(conjured_item.sell_in).to eq(2)
    end

    it 'updates the quality of a generic item correctly' do
      generic_item = Item.new('Generic Item', 7, 25)
      gilded_rose = GildedRose.new([generic_item])

      gilded_rose.update_quality(1)

      expect(generic_item.quality).to eq(24)
      expect(generic_item.sell_in).to eq(6)
    end
  end
end

