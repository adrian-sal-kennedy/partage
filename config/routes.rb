Rails.application.routes.draw do
  devise_for :users
  resources :businesses do
    resources :resources
    resources :agreements
  end
  resources :users do
    resources :resources
    resources :agreements
  end
  resources :resources do
    resources :agreements
  end
  root to: 'welcome#index'
  get ':format', to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
