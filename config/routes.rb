Rails.application.routes.draw do
  resources :attendances
  resources :events # , :only => [:new, :create, :index]
  devise_for :users, path: '', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :users
end
