Rails.application.routes.draw do
  devise_for :accounts

  resources :questions do
    resources :replies
  end

  root "questions#index"
end
