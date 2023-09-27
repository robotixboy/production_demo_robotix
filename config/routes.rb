Rails.application.routes.draw do
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "teacher", to: "teacher#index"

  get "s", to: "s#new" # for the student
  post "s", to: "s#create" # for the student

  get "create", to: "create#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
