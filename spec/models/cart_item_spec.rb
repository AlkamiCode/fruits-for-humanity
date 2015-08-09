require "rails_helper"

describe CartItem do
  it "returns the name of the item" do
    item = Item.new(title: "Item1", description: "Super cool test item", price: 1.99)
    item.categories.new(name: 'test').save
    item.save

    cart_item = CartItem.new(item)
    expect(cart_item.title).to eq("Item1")
  end

  it "returns the quantity for an item" do
    item = Item.new(title: "Item1", description: "Super cool test item", price: 1.99)
    item.categories.new(name: 'test').save
    item.save

    cart_item = CartItem.new(item, 2)
    expect(cart_item.quantity).to eq(2)
  end
end