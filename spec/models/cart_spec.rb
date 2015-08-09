require_relative "../../app/models/cart"
require "rails_helper"

describe Cart do
  attr_reader :cart, :item

  before (:each) do
    @item = Item.new(title: "testitem", description: "Super cool test item", price: 1.99)
    @item.categories.new(name: 'test').save
    @item.save

    @item_quantity = 3
    @cart = Cart.new({})
    @cart.add_item(@item.id, @item_quantity)
    @cart_items = @cart.items
  end

  it "stores contents" do
    expect(cart.contents).to eq({"#{item.id}" => @item_quantity})
    expect(cart.contents).to_not eq({"9" => 6})
  end

  it "adds items to contents" do
    item1 = Item.new(title: "testitem1", description: "Super cool test item 1", price: 3.50)
    item1.categories.new(name: 'test1').save
    item1.save

    item1_quantity = 5

    cart.add_item(item1.id, item1_quantity)

    expect(cart.contents).to eq({"#{item.id}" => @item_quantity, "#{item1.id}" => item1_quantity})
    expect(cart.contents).to_not eq({"9" => 2, "7" => 8})
  end

  it "counts total items" do
    expect(cart.count_all).to eq(3)
    expect(cart.count_all).to_not eq(2)
  end

  it "counts quantity of an item" do
    expect(cart.count_of(item.id)).to eq(3)
    expect(cart.count_of("7")).to_not eq(7)
  end

  it "calculates total price of all items" do
    expect(cart.total_items_price(@cart_items)).to eq(5.97)
  end
end