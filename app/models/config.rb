class Config < ApplicationRecord
  def self.set_active_menu(menu_id)
    # entry = Config.exists(key: "active_menu")
    if Config.exists?(key: "active_menu")
      entry = Config.find_by(key: "active_menu")
      entry.value = menu_id
      entry.save
    else
      Config.create(key: "active_menu", value: menu_id)
    end
  end

  def self.active_menu_id
    all.find_by(key: "active_menu").value.to_i
  end
end
