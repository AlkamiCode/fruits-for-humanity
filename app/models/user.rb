class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true, uniqueness: true, length: { in: 5..12 }
  validates :password, length: { in: 5..12 }, confirmation: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, uniqueness: true, presence: true,
                            format: { with: VALID_EMAIL_REGEX },
                            length: {maximum: 25}

  enum role: %w(default, admin)
end
