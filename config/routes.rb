Rails.application.routes.draw do
  resources :exams
  resources :subjects
  get 'dashboard/index'
  get '/admin/(:approval)', to: 'admin#index', as: 'admin'
  get '/teacher', to: 'teacher#index', as: 'teacher_index'


  devise_for :users, :controllers => { :registrations => "users/registrations", :invitations => "users/invitations" }

  resources :users, only: [:index, :edit, :destroy, :update]
  root to: "home#index"
end
