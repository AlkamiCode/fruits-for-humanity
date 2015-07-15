require "rails_helper"

RSpec.feature "the authenticated user" do

  before (:each) do
    user = User.create(username: "dmitry", password: "kicks ass", email_address: "dmitryiscool@address.com")

    visit root_path

    within ("#loginModal") do
      fill_in "Username", with: "dmitry"
      fill_in "Password", with: "kicks ass"
      click_button "Login"
    end
  end

  scenario "can login" do
    expect(page).to have_content("Welcome Back dmitry")
  end

  scenario "can logout" do
    click_link("Logout")

    expect(page).to have_content("Register")
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end

  scenario "receives error message if login field is left blank" do
    click_link("Logout")

    within ("#loginModal") do
      fill_in "Username", with: "dmitry"
      click_button "Login"
    end

    expect(page).to have_content("Incorrect Login")
  end

  scenario "views order details after checking out" do
    item = Item.new(title: "Apricot", description: "it's orange", price: 2.00)
    category = item.categories.new(name: "Fruit")
    category.save!
    item.save!

    visit category_path(category.id)
    select "3", from: "quantity"
    click_button("Add To Cart")

    visit cart_path
    click_button("Checkout")
  end
end








