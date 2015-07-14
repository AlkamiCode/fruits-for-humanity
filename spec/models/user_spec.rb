require 'rails_helper'

RSpec.describe User, type: :model do
  attr_accessor :user

  before (:each) do
    @user = User.create!(username: "moesky", password: "dough", email_address: "moedough@hotmail.com")
  end

  it 'should be valid' do
    expect(user).to be_valid
  end

  it 'should not be valid without a full name' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'name should not be valid with only spaces' do
    user.username = "     "
    expect(user).to_not be_valid
  end

  it 'username should not be valid with less than 5 characters' do
    user.username = "xyz1"
    expect(user).to_not be_valid
  end

  it 'username should not be valid with more than 12 characters' do
    user.username = "x" * 13
    expect(user).to_not be_valid
  end

  it 'should not be valid without an email address' do
    user.email_address = nil
    expect(user).to_not be_valid
  end

  it 'should have a unique email address' do
    User.create(username: "moey", password: "doughy", email_address: "moedough@hotmail.com")

    email_count = User.where(email_address: "moedough@hotmail.com").count
    expect(email_count).to eq(1)
  end
end
