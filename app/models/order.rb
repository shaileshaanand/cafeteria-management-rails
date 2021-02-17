class Order < ApplicationRecord
  validates :date, presence: true
  has_many :order_items
  belongs_to :user
end
