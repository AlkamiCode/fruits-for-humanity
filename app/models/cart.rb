class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
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

  def update_item_quantity(item_id, initial_quantity, new_quantity)
    if initial_quantity > new_quantity
      difference = new_quantity - initial_quantity
      self.add_item(item_id, difference)
    else initial_quantity < new_quantity
      difference = new_quantity - initial_quantity
      self.add_item(item_id, difference)
    end
  end
end