Rails.application.routes.draw do
  root to: 'pages#home'

  get 'dashboard/index'

  get 'pricing', to: 'pages#pricing', as: :pricing

  resources :projects do 
    resources :tasks do 
      member do 
        patch "remove_team_member"
      end
    end
  end
  resources :team_members

  devise_for :users
  devise_for :team_members, path: "project_members"


end
