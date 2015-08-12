module TestHelpers

  def add_to_cart(quantity="1")
    select quantity, from: "quantity"
    click_button("Add To Cart")
  end

  def sign_in_as(user)
    user
    visit root_path

    within ("#LoginModal") do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Login"
    end
  end

  def admin
    User.create(
      username: "admin",
      password: "rules",
      email_address: "admin@gmail.com",
      role: 1)
  end

  def user
    User.create(
      email_address: 'joe@site.com',
      username: 'joe',
      password: 'password',
      role: 1)
  end

  def jeff
    User.create(
      email_address: "demo+jeff@jumpstartlab.com",
      username: "j3",
      password: "password")
  end

  def rachel
    User.create(
      email_address: "demo+rachel@jumpstartlab.com",
      password: "password",
      username: nil)
  end
end
