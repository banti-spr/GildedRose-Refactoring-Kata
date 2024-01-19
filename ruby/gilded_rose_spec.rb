require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    context 'Aged Brie' do
      it 'increases quality and decreases sell_in' do
        items = [Item.new("Aged Brie", 5, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(11)
        expect(items[0].sell_in).to eq(4)
      end
    end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'increases quality by 3 when sell_in is 5 or less' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(13)
      end

      it 'increases quality by 2 when sell_in is between 6 and 10' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(12)
      end

      it 'increases quality by 1 when sell_in is more than 10' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(11)
      end

      it 'sets quality to 0 when sell_in is less than 0' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(0)
      end
    end

    context 'Sulfuras, Hand of Ragnaros' do
      it 'does not change quality or sell_in' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(80)
        expect(items[0].sell_in).to eq(5)
      end
    end

    context 'Conjured Mana Cake' do
      it 'decreases quality by 2 and decreases sell_in' do
        items = [Item.new("Conjured Mana Cake", 5, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(8)
        expect(items[0].sell_in).to eq(4)
      end
    end

    context 'Other items' do
      it 'decreases quality by 1 and decreases sell_in' do
        items = [Item.new("Normal Item", 5, 10)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        expect(items[0].quality).to eq(9)
        expect(items[0].sell_in).to eq(4)
      end
    end
  end
end


