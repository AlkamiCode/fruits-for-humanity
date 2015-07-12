require "rails_helper"

RSpec.feature "the authenticated user" do
  scenario "registered user can login" do
    user = User.create(username: "dmitry", password: "kicks ass")

    visit login_path

    fill_in "Username", with: "dmitry"
    fill_in "Password", with: "kicks ass"
    click_button "Login"

    expect(page).to have_content("Welcome Back dmitry")
  end
end