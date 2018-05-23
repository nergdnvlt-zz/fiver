Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: %i[new create]

  get '/:slug', to: 'users#show', as: 'user'
end
