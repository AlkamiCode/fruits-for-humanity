require "rails_helper"

RSpec.feature "Admin" do

  scenario 'logs in and sees Admin home page' do
    admin = User.create(username: "admin",
                        password: "rules",
                        email_address: "admin@gmail.com",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_orders_path
    assert page.has_content?("Orders")
  end

  scenario "default user sees 404 error in admin area" do
    user = User.create(username: "joerugular",
                       password: "password",
                       email_address: "joesmo@yahoo.com",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_orders_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end