Rails.application.routes.draw do
  get 'reservs/index'
  get 'inns/index'
  devise_for :users
  root 'lodg#index'
  get 'lodg', to: "lodg#index"
  get 'inn/index'
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :inns
  resources :reservs
end
