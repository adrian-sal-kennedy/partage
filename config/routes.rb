Rails.application.routes.draw do
  devise_for :users
  resources :businesses do
    resources :resources
    resources :agreements
  end
  resources :agreements
  resources :resources
  # get 'agreements/index'
  # get 'agreements/show'
  # get 'agreements/new'
  # get 'agreements/create'
  # get 'agreements/update'
  # get 'agreements/destroy'
  # resources :resources
  # # get 'resources/index'
  # # get 'resources/show'
  # # get 'resources/new'
  # # get 'resources/create'
  # # get 'resources/update'
  # # get 'resources/destroy'
  # resources :businesses
  # # get 'businesses/index'
  # # get 'businesses/show'
  # # get 'businesses/new'
  # # get 'businesses/create'
  # # get 'businesses/update'
  # # get 'businesses/destroy'
  # # get 'businesses/edit'
  # # get 'businesses', to: 'businesses#index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
