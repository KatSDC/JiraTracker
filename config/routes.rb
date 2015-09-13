Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :projects, only: [:index, :show]
  resources :tickets, only: [:index, :show]
  resources :developers, only: [:index, :show]

end
