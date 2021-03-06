require "rails_helper"


RSpec.feature "the unauthenticated user" do
  attr_accessor :item, :category

  before(:each) do
    @item = Item.new(title: "Apricot", description: "it's orange", price: 2.00)
    @category = item.categories.new(name: "Fruit")
    category.save!
    item.save!
  end

  include FeatureSpecHelpers

  scenario "can add an item with a category to its cart" do
    visit root_path

    click_link(item.categories.first.name)

    add_to_cart

    page.find(".carts").click

    expect(current_path).to eq(cart_path)

    expect(page).to have_content(category.items.first.title)
    expect(page).to have_content(category.items.first.description)
    expect(page).to have_content("1")

    expect(page).to have_content(item.categories.first.name)
  end

  scenario "can clear all items from its cart" do
    visit category_path(category.id)

    click_button("Add To Cart")

    page.find(".carts").click

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)

    click_button("Clear Cart")

    expect(page).to_not have_content(item.title)
    expect(page).to_not have_content(item.price)
  end

  scenario "can add multiple quantity of an item to a cart" do
    visit category_path(category.id)

    add_to_cart("3")

    # expect(@cart.items.last.quantity).to eq(3)
    expect(page).to have_content("You now have 3")
  end

  scenario "can update item quantity before checking out" do
    visit category_path(category.id)

    add_to_cart("4")

    visit cart_path

    expect(page).to have_content("$8.0")

    select "3", from: "quantity"

    click_button("Update")

    expect(page).to_not have_content("$8.0")
    expect(page).to have_content("$6.0")
  end

  scenario "can remove a cart_item from its cart" do
    visit category_path(category.id)

    add_to_cart("3")

    visit cart_path

    expect(page).to have_content(item.title)

    click_link("Delete")

    expect(page).to_not have_content(item.title)
  end

  scenario "can calculate total cost per item" do
    visit category_path(category.id)

    add_to_cart("6")

    visit cart_path

    expect(page).to have_content("$12.0")
  end

  scenario "can calculate total cost of all items in cart" do
    item1 = Item.new(title: "Broccoli", description: "Tasts like shit raw", price: 3.50)
    category1 = item1.categories.new(name: "Vegitables")
    category1.save!
    item1.save!

    visit category_path(category.id)
    add_to_cart("3")

    visit category_path(category1.id)
    add_to_cart("4")

    visit cart_path

    expect(page).to have_content("$14.0")
    within('td.price') { expect(page).to have_content("$20.0")}
  end

  scenario "receives error message when registration field is empty" do
    visit category_path(category.id)

    within ("#RegisterModal") do
      fill_in "E-mail",   with: "dmitryiscool@gmail.com"
      fill_in "Username", with: ""
      fill_in "Password", with: "rocks"
      click_button "Create Account"
    end

    expect(page).to have_content("Please Try Again")
    expect(page).to have_content("Register")
    expect(page).to_not have_content("Logout")
  end

  scenario "adds items to cart, registers, and items are still magically there" do
    visit category_path(category.id)
    add_to_cart("4")

    register_user("dmitryiscool@gmail.com", "dmitry", "rocks")

    expect(page).to have_content("Welcome! dmitry")

    visit cart_path

    expect(page).to have_content(item.title)
  end

  scenario "receives email after successfully registering" do
    visit category_path(category.id)

    within ("#RegisterModal") do
      fill_in "E-mail",   with: "dmitryiscool@gmail.com"
      fill_in "Username", with: "dmitry"
      fill_in "Password", with: "rocks"
      click_button "Create Account"
    end
    # still working on this
  end
end