Rails.application.routes.draw do
  get '/admin/(:approval)', to: 'admin#index', as: 'admin'
  get '/teacher', to: 'teacher#index', as: 'teacher_index'
  get '/student', to: 'student#index', as: 'student_index'
  get '/api/users/all', to: 'admin#get_all_users', defaults: { format: 'json' }

  devise_for :users, :controllers => { :registrations => "users/registrations", :invitations => "users/invitations" }

  resources :users, only: [:index, :edit, :destroy, :update]
  root to: "home#index"
  resources :subjects do
    resources :exams
  end

  post '/subject/:subject_id/exam/:id', to: 'exam_student#create_grade', as: 'exam_students'
  delete '/subject/:subject_id/exam/:id/:grade_id', to: 'exam_student#delete', as: 'delete_exam_student'
  post '/subject/:id/subscribe', to: 'subjects#add_student', as: 'subject_students'
  delete '/subject/:id/unsubscribe/:student_id', to: 'subjects#remove_student', as: 'delete_subject_student'



end
