class Order < ApplicationRecord
  validates :date, presence: true
  has_many :order_items
  belongs_to :user

  def self.pending
    all.where(status: false)
  end
end
