Rails.application.routes.draw do
  devise_for :users
  root 'cities#index'
  resources :users, only: [:show]
  resources :cities
  authenticate :user do
    mount Resque::Server, :at => '/resque'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
