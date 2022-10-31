Rails.application.routes.draw do
  root to: 'pages#home'

  get 'dashboard/index'

  get 'pricing', to: 'pages#pricing', as: :pricing

  devise_for :users

  resources :projects
end
