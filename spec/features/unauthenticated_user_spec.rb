require 'rails_helper'

RSpec.feature 'the unauthenticated user' do
  let!(:category) { Category.create!(name: "Fruit") }
  let!(:item)     { Item.create!(title: "Apricot", description: "it's orange", price: 2.00) }

  scenario "can add an item with a category to its cart" do
    CategoryItem.create(item_id: item.id, category_id: category.id)

    visit root_path

    expect(current_path).to eq(root_path)

    click_link(category.name)

    click_button("Add To Cart")

    click_link("Cart")

    expect(current_path).to eq(cart_path)

    expect(page).to have_content(category.items.first.title)
    expect(page).to have_content(item.categories.first.name)
  end

  scenario "can clear all items from its cart" do
  end

  scenario "can increment or decrement the same item to its cart from the cart page" do
  end

  scenario "can remove an item from its cart" do
  end

  scenario "cannot checkout" do

  end
end