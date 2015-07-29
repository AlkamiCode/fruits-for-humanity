require "rails_helper"

RSpec.feature "Admin" do

  before (:each) do
    @admin = User.create(username: "admin",
                        password: "rules",
                        email_address: "admin@gmail.com",
                        role: 1)

    visit root_path

    within ("#LoginModal") do
      fill_in "Username", with: "admin"
      fill_in "Password", with: "rules"
      click_button "Login"
    end
  end

  scenario "logs in and sees Admin home page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path
    assert page.has_content?("Orders")
  end

  scenario "creates item in existing category" do
    category = Category.create!(name: "Bam")

    visit admin_categories_path

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

  scenario "retires item from user view" do
    item = Item.new(title: "Orange", description: "it's orange", price: 2.00, available: true)
    category = item.categories.new(name: "Fruit")
    category.save!
    item.save!

    visit admin_category_path(category.id)
    expect(page).to have_content(item.title)
    expect(item.available).to eq(true)

    click_button("Update")

    within ("#Update-item-#{item.id}") do
      select false, from: "Available"
      click_button "Update"
    end
    item.reload

    expect(item.available).to eq(false)

    click_link("Logout")

    visit category_path(category.id)

    expect(page).to have_content("This Category Is Empty")
  end

  scenario "retires entire category of items from user view" do
    item1 = Item.new(title: "Mango", description: "it's hairy", price: 3.00, available: true)
    item2 = Item.new(title: "Orange", description: "it's orange", price: 2.00, available: true)
    category = item1.categories.new(name: "Passion Fruit")
    category.save!
    item1.save!
    item2.categories << category
    item2.save!

    visit admin_categories_path
    expect(category.items.all? {|item| item.available}).to eq(true)

    click_link("Retire")
    category.reload

    expect(category.items.all? {|item| item.available}).to eq(false)

    click_link("Logout")

    expect(page).to_not have_link(category.name)
  end

  scenario "updates item attributes" do
    item = Item.new(title: "Orange", description: "it's orange", price: 2.00, available: true)
    category = item.categories.new(name: "Fruit")
    category.save!
    item.save!

    visit admin_category_path(category.id)
    click_button('Update')

    within ("#Update-item-#{item.id}") do
      fill_in "Title", with: "Green"
      fill_in "Price", with: 2.50
      click_button "Update"
    end
    item.reload

    expect(item.title).to eq("Green")
    expect(item.price).to eq(2.50)
  end
end







