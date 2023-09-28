Rails.application.routes.draw do

  resources :teachers
  #get 'teacher/index', to: 'teacher#index', as: 'teacher_index'
  get 'teacher/login', to: 'teacher#login', as: 'teacher_login'
  #get 'teachers/index'
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get "teacher", to: "teacher#index"

  get "s", to: "s#new" # for the student
  post "s", to: "s#create" # for the student

  get "create", to: "create#index"

  # Defines the root path route ("/")
  # root "articles#index"


  ##These are used for checking the database for log in credentials
  resources :teachers do
    post 'check_credentials', on: :collection
  end
end
