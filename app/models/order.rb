class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  include AASM

  enum status: %w(ordered paid cancelled completed)

  aasm :column => :status, :enum => true do
    state :ordered, :initial => true
    state :paid
    state :cancelled
    state :completed

    event :pay do
      transitions from: :ordered, to: :paid
    end

    event :cancel do
      transitions from: [:ordered, :paid], to: :cancelled
    end

    event :complete do
      transitions from: :paid, to: :completed
    end
  end
end
