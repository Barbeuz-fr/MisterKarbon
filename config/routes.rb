Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :report_scope_orgas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
