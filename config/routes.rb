Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reports, except: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reports do
    get "results", to: "reports#result"
  end

  # Route pour update du status
  resources :report_scope_orgas, only: [] do
    get "send_report", to: "report_scope_orgas#send_report"
  end



end
