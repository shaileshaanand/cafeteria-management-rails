class Order < ApplicationRecord
  validates :date, presence: true
  has_many :order_items
  belongs_to :user

  def self.pending
    all.where(status: false)
  end

  def self.between(start_date, end_date)
    end_date = end_date.to_datetime + 1
    all.where(:date => start_date..end_date)
  end
end
