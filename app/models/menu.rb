class Menu < ApplicationRecord
  has_many :menu_items, dependent: :delete_all

  def active?
    id == Config.active_menu_id
  end

  def self.active_menu
    all.find(Config.active_menu_id)
  end
end
