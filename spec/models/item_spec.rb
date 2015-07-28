require 'rails_helper'

RSpec.describe Item, type: :model do
  attr_accessor :item

  before do
    @item = Item.new(title: "Item#1", description: "Super cool item", price: 1.99)
    @item.categories.new(name: 'test').save
    @item.save
  end

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'must have a title' do
    item.title = nil
    expect(item).to_not be_valid
  end

  it 'cannot have an empty string for a title' do
    item.title = ""
    expect(item).to_not be_valid
  end

  it 'must have a unique title' do
    2.times { Item.create(title: "Item#1", description: "Super cool item", price: 1.99) }
    items = Item.where(title: 'Item#1')
    expect(items.size).to eq(1)
  end

  it 'must have a description' do
    item.description = nil
    expect(item).to_not be_valid
  end

  it 'must have a price' do
    item.price = nil
    expect(item).to_not be_valid
  end

  it 'price must be a valid decimal numeric value' do
    item.price = "not a decimal"
    expect(item).to_not be_valid
  end

  it 'price must be greater than zero' do
    item.price = -1.00
    expect(item).to_not be_valid
  end

  it 'must belong to at least one category' do
    item_blah = Item.new(title: 'test', description: 'desc', price: 3.00)
    expect(item_blah).to_not be_valid
  end

  it 'can be created without a photo' do
     expect(@item.image_file_name).to be_nil
  end
end
