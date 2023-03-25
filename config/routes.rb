Rails.application.routes.draw do
  devise_for :accounts
  resources :posts
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/edit'
  # get 'questions/update'
  # get 'questions/create'
  # get 'questions/delete'
  # get 'questions/set_params'
  
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "questions#index"
end
