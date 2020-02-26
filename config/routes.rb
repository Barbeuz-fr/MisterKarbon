Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :reports, except: :new do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :report_scopes, except: :destroy
  end
  
  resources :report_scopes, only: :destroy

  get "reports/:id/results", to: "reports#result"
  
end
