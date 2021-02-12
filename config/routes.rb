Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/admin" => "admin#index", as: :admin_home
  get "/admin/users" => "admin#users", as: :admin_users
  resources :users
  resources :menus
  resources :menu_items
end
