Rails.application.routes.draw do
  get '/admin/(:approval)', to: 'admin#index', as: 'admin'
  get '/student', to: 'student#index', as: 'student_index'
  get '/api/users/all', to: 'admin#get_all_users', defaults: { format: 'json' }

  devise_for :users, :controllers => { :registrations => "users/registrations", :invitations => "users/invitations" }

  resources :users, only: [:index, :edit, :destroy, :update]
  root to: "home#index"
  resources :subjects do
    resources :exams
  end

end
