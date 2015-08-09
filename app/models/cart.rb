class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def items
    @contents.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def add_item(item_id, item_quantity)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s]  += item_quantity.to_i
  end

  def count_all
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def total_items_price(items)
    items.reduce(0) do |sum, item|
      sum += (item.quantity * item.price)
    end
  end
end