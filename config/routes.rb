Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reports, except: :new
  #only destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reports
  get "reports/:id/results", to: "reports#result"
end
