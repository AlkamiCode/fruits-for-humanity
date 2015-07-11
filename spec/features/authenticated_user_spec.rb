require "rails_helper"

RSpec.feature "the authenticated user" do
  scenario "a user can be registered" do
    visit new_user_path
save_and_open_page
    fill_in "Username", with: "dmitry"
    fill_in "Password", with: "rocks"
    click_button "Create Account"

    expect(page).to have_content("Welcome dmitry")
  end
end