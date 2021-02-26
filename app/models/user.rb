class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  has_secure_password
  has_many :orders
  has_many :cart_items

  def admin?
    role == "admin"
  end

  def clerk?
    role == "clerk"
  end

  def customer?
    role == "customer"
  end

  def self.customers
    User.where(role: "customer")
  end
  def self.clerks
    User.where(role: "clerk")
  end
  def self.owners
    User.where(role: "admin")
  end

  def cart_items_count
    cart_items.map { |cart_item|
      cart_item.amount
    }
      .reduce(0, :+)
  end

  def cart_total
    cart_items.map { |cart_item|
      cart_item.amount * cart_item.menu_item.price
    }
      .reduce(0, :+)
  end

  def self.walk_in_customer
    all.find(Config.walk_in_customer_id)
  end
end
