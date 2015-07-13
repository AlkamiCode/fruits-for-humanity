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

  scenario "registered user can login" do
    expect(page).to have_content("Welcome Back dmitry")
  end

  scenario "can logout" do
    click_link("Logout")

    expect(page).to have_content("Register")
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end