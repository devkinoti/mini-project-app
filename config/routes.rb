Rails.application.routes.draw do
  root to: 'pages#home'

  get 'dashboard/index'
  get 'activities/index'
  get 'profile/:id', to: "profile#show", as: :profile

  get 'pricing', to: 'pages#pricing', as: :pricing

  resources :projects do 
    resources :tasks do 
      member do 
        patch "remove_team_member"
      end
    end

    member do 
      get "team_members"
      get "reports"
      get "project_report"
    end
  end

  resources :team_members

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_for :team_members, controllers: {
    sessions: "project_members/sessions"
  }, path: "project_members"


end
