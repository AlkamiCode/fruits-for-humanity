require "rails_helper"

RSpec.feature "the unauthenticated user" do
  attr_accessor :item, :category

  before(:each) do
    @item = Item.new(title: "Apricot", description: "it's orange", price: 2.00)
    @category = item.categories.new(name: "Fruit")
    category.save!
    item.save!
  end

  scenario "can add an item with a category to its cart" do
    visit root_path

    expect(current_path).to eq(root_path)

    click_link(item.categories.first.name)

    click_button("Add To Cart")

    page.find(".cart").click

    expect(current_path).to eq(cart_path)

    expect(page).to have_content(category.items.first.title)
    expect(page).to have_content(category.items.first.description)
    expect(page).to have_content("1")

    expect(page).to have_content(item.categories.first.name)
  end

  scenario "can clear all items from its cart" do
    visit category_path(category.id)

    click_button("Add To Cart")

    page.find(".cart").click

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)

    click_button("Clear Cart")

    expect(page).to_not have_content(item.title)
  end

  scenario "can add multiple quantities of an item to a cart" do
    visit category_path(category.id)

    select "3", from: "quantity"

    click_button("Add To Cart")

    expect(page).to have_content("5")

    visit cart_path

    expect(page).to have_content("5")
  end

  scenario "can update item quantity before checking out" do
    visit category_path(category.id)

    select "4", from: "quantity"

    click_button("Add To Cart")

    visit cart_path

    expect(page).to have_content("4")

    select "3", from: "quantity"

    click_button("Update")

    expect(page).to have_content("3")
  end

  scenario "can remove a cart_item from its cart" do
    visit category_path(category.id)

    select "3", from: "quantity"

    click_button("Add To Cart")

    visit cart_path

    expect(page).to have_content(item.title)

    click_link("Delete")

    expect(page).to_not have_content(item.title)
  end

  scenario "can calculate total cost per item" do
    visit category_path(category.id)

    select "6", from: "quantity"

    click_button("Add To Cart")

    visit cart_path

    expect(page).to have_content(12.0)
  end

  scenario "can calculate total cost of all items in cart" do
    item1 = Item.new(title: "Broccoli", description: "Tasts like shit raw", price: 3.50)
    category1 = item1.categories.new(name: "Vegitables")
    category1.save!
    item1.save!

    visit category_path(category.id)
    select "3", from: "quantity"
    click_button("Add To Cart")

    visit category_path(category1.id)
    select "4", from: "quantity"
    click_button("Add To Cart")

    visit cart_path

    expect(page).to have_content(6.0)
    expect(page).to have_content(14.0)
    expect(page).to have_content(20.0)
  end

  scenario "after user registers items are still in cart" do
    visit category_path(category.id)
    select "4", from: "quantity"
    click_button("Add To Cart")

    visit new_user_path

    expect do
      fill_in "E-mail", with: "dmitryiscool@gmail.com"
      fill_in "Username", with: "dima"
      fill_in "Password", with: "rocks"
      click_button "Create Account"
    end.to change { User.count }.from(0).to(1)

    expect(page).to have_content("Welcome! dima")

    visit cart_path

    expect(page).to have_content(item.title)
  end

  scenario "cannot checkout" do
  end
end