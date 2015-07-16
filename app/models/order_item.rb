class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order, dependent: :destroy
end
