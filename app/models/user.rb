class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :username, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, uniqueness: true, presence: true,
                            format: { with: VALID_EMAIL_REGEX }
  validates :username, length: { in: 5..12 }
end
