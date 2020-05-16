Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  # omniauth
  get '/auth/:provider/callback', to: 'sessions#create'
  
  # settings
  get  'setting/:id',          to: 'settings#show',            as: 'settings'
  get  'setting/:id/facebook', to: 'settings#enble_instagram', as: 'settings_instagram'
  post 'setting/update',       to: 'settings#update'
  
end
