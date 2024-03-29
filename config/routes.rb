Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/mentions-legales', to: 'pages#mentions_legales'


  # Lien vers formulaire de contact par email
  resources :contacts, only: [:new, :create]
  # Alternative to "resources"
  # get  "contacts/new", to: "contacts#new", as: :new_contact
  # post "contacts/new", to: "contacts#create"


  # creation et destroy de report_scope lors de la creation d'un projet
  resources :report_scope_orgas, only: [:destroy]

  # Vue sur la base ADEME
  resources :ademe_emission_factors, only: [:index]

  resources :reports do
    resources :report_scopes, except: :destroy
    resources :report_scope_orgas
    resources :report_scope_orga_users, only: [:index]
    # Route custom pour affichage du graphique
    get "results", to: "reports#result"
  end

  # Creation et edit de l'organisation d'une company
  resources :companies, only: [:show] do
    resources :orgas
  end

  resources :report_scopes, only: :destroy

  resources :report_scope_orgas, only: [] do
    get "send_report", to: "report_scope_orgas#send_report"
    # Route pour definir un email
    resources :report_scope_orga_users, only: [:new, :create, :destroy]
  end

  # Ajout ou edit d'un emission module
  resources :emission_modules, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :questions, only: [:new, :create, :destroy, :edit, :update]
  end

  # Test orga à plusieurs niveaux
  resources :testorgas, only: [:index]

  # Routes pour les articles
  resources :articles

  # Routes directes vers articles
  get '/ressources/reglementation_entreprise', to: 'articles#reglementation_entreprise'
  get '/ressources/comment_faire_son_bilan_carbone', to: 'articles#comment_faire_son_bilan_carbone'
  get '/ressources/scope_1_2_3', to: 'articles#scope_1_2_3'
  get '/ressources/pourquoi_faire_son_bilan_carbone', to: 'articles#pourquoi_faire_son_bilan_carbone'


  # Routes test pour emission factor
  get '/emission_factors', to: 'emission_factors#index'

end
