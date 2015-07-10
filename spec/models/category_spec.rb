require 'rails_helper'

RSpec.describe Category, type: :model do
  attr_accessor :category

  before do
    @category = Category.create!(name: "Fruits")
  end

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'must have a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'cannot have an empty string for a name' do
    category.name = ""
    expect(category).to_not be_valid
  end

  it 'must have a unique name' do
    2.times { Category.create(name: "Fruits") }
    categorys = Category.where(name: "Fruits")
    expect(categorys.size).to eq(1)
  end
end
