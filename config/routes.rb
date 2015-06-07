Rails.application.routes.draw do
  devise_for :admins
  root to: 'visitors#index'
  devise_for :users
  resource :users
  resource :dogs
  # edit_dog '/dogs/:id' to: 'dogs#update' as: update_dog
end
