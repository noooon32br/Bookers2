Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'top' => 'homes#top'
  resources :books, only: [:new, :create, :show, :index, :edit, :destroy]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
