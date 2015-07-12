require "rails_helper"

RSpec.feature "the authenticated user" do

  before (:each) do
    user = User.create(username: "dmitry", password: "kicks ass", email_address: "dmitryiscool@address.com")

    visit login_path

    fill_in "Username", with: "dmitry"
    fill_in "Password", with: "kicks ass"
    click_button "Login"
  end

  scenario "registered user can login" do
    expect(page).to have_content("Welcome Back dmitry")
  end

  scenario "gets error message when trying to visit login page" do
    visit login_path
    expect(page).to_not have_link("Login")
    expect(page).to have_content("You're Already Logged In")
  end

  scenario "gets error message when trying to visit registration path" do
    visit new_user_path
    expect(page).to_not have_link("Register")
    expect(page).to have_content("You're Already Registered")
  end
end