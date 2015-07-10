class Category < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  validates :name, presence: true, uniqueness: true
end