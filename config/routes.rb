Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    get 'shows/behind', to: 'shows#behind'
    resources :shows, only: [:index]
  end
  resources :listings, only: [:destroy]
  resources :shows do
    get 'mark_as_favorite'
    get 'unmark_as_favorite'
    resources :listings, except: [:index, :destroy]
  end
  resources :channels, only: [:index, :show]
  get '/search', to: 'shows#search'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
