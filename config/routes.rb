Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get '/community', to: 'static_page#community'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/search', to: 'posts#search'
  get '/login', to: 'sessions#new'
  get '/postnew', to: 'posts#new'
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/about', to: 'static_page#about'
  root 'static_page#home'

  resources :users
  resources :password_resets,  only: [:new, :create, :edit, :update]
  resources :user_resets,  only: [:new]
  resources :posts
  #resources :posts,  only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
