Rails.application.routes.draw do
  devise_for :users
  root 'top#index'


  get '/auth/:provider/callback', to: 'sessions#create'
  
  get  'setting/:id', to: 'settings#show', as: 'settings'
  post 'setting/update', to: 'settings#update' 
  
end
