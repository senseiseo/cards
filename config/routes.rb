Rails.application.routes.draw do
  root 'cardwords#index'
  resources :cardwords
end
