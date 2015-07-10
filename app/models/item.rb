class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only: :decimal, greater_than: 0 }
  validates :categories, presence: true
end