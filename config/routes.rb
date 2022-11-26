Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'top' => 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :show, :index, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
