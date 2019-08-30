require 'item'
require 'update_quality'

class GildedRose
  include UpdateQuality
  def initialize(items)
    # DO NOT TOUCH ITEMS PROPERTY
    @items = items
  end
end
