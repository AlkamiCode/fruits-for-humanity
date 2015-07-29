class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only: :decimal, greater_than: 0 }
  validates :categories, presence: true

  has_attached_file :image, default_url: "vegitable_mix.jpg", styles: {
    thumbnail: '60x60>',
    thumb:     '100x100>',
    small:     '300x300#',
    medium:    '500x500>',
    large:     '1000x1000>'
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end