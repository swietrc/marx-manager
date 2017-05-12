Rails.application.routes.draw do
  get 'dashboard/index'
  get '/admin/(:approval)', to: 'admin#index', as: 'admin'

  devise_for :users
    
  resources :users, only: [:index, :edit, :destroy, :update]
  root to: "home#index"
end
