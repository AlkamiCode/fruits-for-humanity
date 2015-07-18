require "rails_helper"

RSpec.feature "Admin" do

  before (:each) do
    @admin = User.create(username: "admin",
                        password: "rules",
                        email_address: "admin@gmail.com",
                        role: 1)
  end

  scenario "logs in and sees Admin home page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path
    assert page.has_content?("Orders")
  end

  scenario "creates item in existing category" do
    category = Category.create!(name: "Bam")

    visit root_path

    within ("#LoginModal") do
      fill_in "Username", with: "admin"
      fill_in "Password", with: "rules"
      click_button "Login"
    end

    expect do
      within ("#AdminAddsItemModal") do
        fill_in "Title", with: "new item"
        fill_in "Description", with: "is wicked gnarly"
        fill_in "Price", with: 10.40
        select category.name, from: "Category"
        click_button "Add Item"
      end
    end.to change { Item.count }.from(0).to(1)
  end

  scenario "creates item and new category" do
    visit root_path

    within ("#LoginModal") do
      fill_in "Username", with: "admin"
      fill_in "Password", with: "rules"
      click_button "Login"
    end

    expect do
      within ("#AdminAddsItemModal") do
        fill_in "Title", with: "new item"
        fill_in "Description", with: "is wicked gnarly"
        fill_in "Price", with: 10.40
        fill_in "New Category", with: "Cool Stuff"
        click_button "Add Item"
      end
    end.to change { Category.count }.from(0).to(1)
  end
end