Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: %i[new create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/:slug', to: 'users#show', as: 'user'
end
