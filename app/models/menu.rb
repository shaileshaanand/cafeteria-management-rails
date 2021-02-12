class Menu < ApplicationRecord
  has_many :menu_items, dependent: :delete_all
end
