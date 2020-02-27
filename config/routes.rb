Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # creation et destroy de report_scope lors de la creation d'un projet
  resources :report_scopes, only: [:destroy]

  resources :reports do
    resources :report_scopes, except: :destroy
    resources :report_scope_orgas
    resources :report_scope_orga_users, only: [:index]
    # Route custom pour affichage du graphique
    get "results", to: "reports#result"
  end

  resources :report_scope_orgas, only: [] do
    get "send_report", to: "report_scope_orgas#send_report"
    # Route pour definir un email
    resources :report_scope_orga_users, only: [:new, :create]
  end

end
