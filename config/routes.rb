Rails.application.routes.draw do
  resources :accounts
  get    '/signup', to: 'accounts#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root    'static_pages#home'
  get 'search' => 'static_pages#search'
  get 'news' => 'static_pages#news'
  get 'store' => 'static_pages#store'
end
