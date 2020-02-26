Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  # creation et destroy de report_scope lors de la creation d'un projet
  resources :report_scopes, only: [:create, :destroy]


  resources :reports do
    resources :report_scopes, except: :destroy
    resources :report_scope_orgas
    # Route custom pour affichage du graphique
    get "results", to: "reports#result"
  end

  # TO DO: DEFINIR LA ROUTE POUR AJOUTER UN EMAIL
  resources :report_scope_orga_users

  # Route pour update du status
  resources :report_scope_orgas, only: [] do
    get "send_report", to: "report_scope_orgas#send_report"
  end

end
