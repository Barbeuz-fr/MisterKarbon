Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :reports, except: :new do
    resources :report_scopes, except: :destroy
    resources :report_scope_orgas
    # Route custom pour affichage du graphique
    get "results", to: "reports#result"
  end

  # Route pour update du status
  resources :report_scope_orgas, only: [] do
    get "send_report", to: "report_scope_orgas#send_report"
  end

  resources :report_scopes, only: :destroy

  # TO DO: DEFINIR LA ROUTE POUR AJOUTER UN EMAIL
  resources :report_scope_orga_users

end
