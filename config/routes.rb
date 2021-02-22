Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/admin" => "admin#index", as: :admin_home
  get "/admin/users" => "admin#users", as: :admin_users
  get "/customer" => "customer#index", as: :customer_home
  get "/customer/cart" => "customer#cart", as: :customer_cart
  get "/customer/orders" => "customer#orders", as: :customer_orders
  get "/clerk" => "clerk#index", as: :clerk_home
  post "/set_active_menu" => "configs#set_active_menu", as: :set_active_menu
  post "/customer/add_to_cart" => "cart_items#add", as: :add_to_cart
  post "/deliver_order" => "orders#deliver", as: :deliver_order
  resources :users
  resources :menus
  resources :menu_items
  resources :cart_items
  resources :orders
end
