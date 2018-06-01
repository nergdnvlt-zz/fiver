Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: %i[new create]
  resources :native_users, controller: 'users', type: 'NativeUser'
  resources :tweets, only: %i[show]

  namespace :api do
    namespace :v1 do
      get '/watson', to: 'watson#show'
    end
  end

  get '/tweets', to: 'tweets#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/:slug', to: 'users#show', as: 'user'

end
