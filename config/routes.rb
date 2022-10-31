Rails.application.routes.draw do
  resources :projects
  root to: 'pages#home'
  get 'dashboard/index'
  get 'pricing', to: 'pages#pricing', as: :pricing
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
