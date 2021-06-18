Rails.application.routes.draw do
  root 'cardwords#index'
 
  resources :cardwords do 
   get :good_response, on: :member
   get :bad_response, on: :member
  end 

end
