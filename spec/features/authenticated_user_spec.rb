require "rails_helper"

RSpec.feature "the authenticated user" do
  scenario "a user can be registered" do
    visit new_user_path

    expect do
      fill_in "Username", with: "dmitry"
      fill_in "Password", with: "rocks"
      click_button "Create Account"
    end.to change { User.count }.from(0).to(1)

    expect(page).to have_content("Welcome dmitry")
  end
end