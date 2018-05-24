Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: %i[new create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/:slug', to: 'users#show', as: 'user'
end
