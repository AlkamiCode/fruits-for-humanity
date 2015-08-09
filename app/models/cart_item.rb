class CartItem < SimpleDelegator
  attr_accessor :quantity
  def initialize(item, quantity=0)
    super(item)
    @quantity = quantity
  end
end