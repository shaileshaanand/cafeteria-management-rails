class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  has_secure_password
  has_many :orders
  def self.customers
    User.where(role: "customer")
  end
  def self.clerks
    User.where(role: "clerk")
  end
  def self.owners
    User.where(role: "owner")
  end
end
