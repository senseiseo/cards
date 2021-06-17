Rails.application.routes.draw do
  root 'cardwords#index'
 
  resources :cardwords do 
   get :up_group, on: :member
  end 

end
