Rails.application.routes.draw do

  resources :students
  resources :teachers
  resources :questions
  resources :answers
  get 'teacher/new', to: 'teachers#new', as: 'teacher_new'
  get 'teacher/index', to: 'teachers#index', as: 'teacher_index'
  get 'teacher/login', to: 'teachers#login', as: 'teacher_login'
  get 'student/login', to: 'students#login', as: 'student_login'
  get 'student/index', to: 'students#index', as: 'student_index'
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
  resources :students do
    post 'check_credentials', on: :collection
  end
end
