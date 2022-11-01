Rails.application.routes.draw do
  devise_for :team_members, controllers: {
    registrations: "team_members/registrations"
  }
  root to: 'pages#home'

  get 'dashboard/index'

  get 'pricing', to: 'pages#pricing', as: :pricing

  devise_for :users

  resources :projects
  resources :team_members
end
