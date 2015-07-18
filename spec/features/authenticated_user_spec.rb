require "rails_helper"

RSpec.feature "the authenticated user" do

  before (:each) do
    user = User.create(username: "dmitry", password: "kicks ass", email_address: "dmitryiscool@address.com")

    visit root_path

    within ("#LoginModal") do
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

    within ("#LoginModal") do
      fill_in "Username", with: "dmitry"
      click_button "Login"
    end

    expect(page).to have_content("Incorrect Login")
  end

  scenario "cannot visit cart page when cart is empty" do
    visit root_path
    page.find(".cart").click

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Must Add Item To View Cart Page")
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

    expect do
      click_button("Checkout")
    end.to change { Order.count }.from(0).to(1)

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)
  end

  scenario "sees 404 error in admin area" do
    user = User.create(username: "joerugular",
                       password: "password",
                       email_address: "joesmo@yahoo.com",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_orders_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end