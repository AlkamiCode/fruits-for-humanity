module FeatureSpecHelpers

  def add_to_cart(quantity="1")
    select quantity, from: "quantity"
    click_button("Add To Cart")
  end

  def register_user(email, username, password)
    within ("#RegisterModal") do
      fill_in "E-mail",   with: email
      fill_in "Username", with: username
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password
      click_button "Create Account"
    end
  end

  def login_non_admin(username, password)
    @user = User.create(username: username, password: password, email_address: "#{username}@address.com")

    visit root_path
    within ("#LoginModal") do
      fill_in "Username", with: username
      fill_in "Password", with: password
      click_button "Login"
    end
  end

  def login_admin(username, password)
    @admin = User.create(username: username, password: password, email_address: "#{username}@gmail.com", role: 1)

    visit root_path
    within ("#LoginModal") do
      fill_in "Username", with: "admin"
      fill_in "Password", with: "rules"
      click_button "Login"
    end
  end

  def create_item(title, description, price, category)
    @item = Item.new(title: title, description: description, price: price)
    @category = @item.categories.new(name: category)
    @category.save!
    @item.save!
  end

  def create_user_order
    create_item("cool item", "it's gnarly", 5.25, "Fruit")
    login_non_admin("bobomo", "grizzly bear")
    visit category_path(@item.categories.last.id)
    add_to_cart
    visit cart_path
    click_button("Checkout")
  end

end
