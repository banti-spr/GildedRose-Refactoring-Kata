class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        increase_quality(item)
        decrease_sell_in(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        increase_quality(item, 3) if item.sell_in > 0 && item.sell_in < 6
        increase_quality(item, 2) if item.sell_in > 5 && item.sell_in < 11
        increase_quality(item) if item.sell_in > 10
        item.quality = 0 if item.sell_in < 0
        decrease_sell_in(item)
      when "Sulfuras, Hand of Ragnaros"
        # being a legendary item, never has to be sold or decreases in Quality
      when "Conjured Mana Cake"
        decrease_quality(item, 2)
        decrease_sell_in(item)
      else
        decrease_quality(item)
        decrease_sell_in(item)
      end
    end
  end

  private

  def decrease_quality(item, amount = 1)
    item.quality -= amount if item.quality > 0
  end

  def increase_quality(item, amount = 1)
    item.quality += amount if item.quality < 50
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
