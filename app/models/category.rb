class Category < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  validates :name, presence: true, uniqueness: true

  has_attached_file :image, default_url: "default-medium.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end