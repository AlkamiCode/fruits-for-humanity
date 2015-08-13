require "rails_helper"

RSpec.feature "the authenticated user" do

  before (:each) do
    login_non_admin("dmitry", "rocks")
  end

  include FeatureSpecHelpers

  scenario "can login" do
    expect(page).to have_content("Welcome Back dmitry")
    # expect(@user).to eq(@current_user)
  end

  scenario "can logout" do
    click_link("Logout")
    # expect(@user).to_not eq(@current_user)
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
    page.find(".carts").click
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Must Add Item(s) To View Cart Page")
  end

  scenario "views order details after checking out" do
    create_item("Apricot", "it's orange", 2.00, "Fruit")

    visit category_path(@category.id)
    add_to_cart(3)

    visit cart_path

    expect do
      click_button("Checkout")
    end.to change { Order.count }.from(0).to(1)

    expect(page).to have_content(@item.title)
    expect(page).to have_content(@item.price)
  end

  scenario "sees 404 error in admin area" do
    login_non_admin("joeregular", "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit admin_orders_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end