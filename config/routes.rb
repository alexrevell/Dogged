Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    resources :dogs
  end
end
