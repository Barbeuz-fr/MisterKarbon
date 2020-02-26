Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reports, except: :new do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :report_scopes, only: [:create]

  end
  resources :report_scopes, only: :destroy

  # TO DO: DEFINIR LA ROUTE POUR AJOUTER UN EMAIL
  resources :report_scope_orga_users


end
