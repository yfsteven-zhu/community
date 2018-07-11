Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"
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
  get 'mentions', to: 'users#mentions'
  root 'static_page#home'

  resources :users do

    member do
      get :following, :followers
      get :overview
      get :posts_list
      get :comments_list
      get :followinglist
      get :followerlist
      get :change_avatar
      get :change_password
    end

    resources :updates, except: [:index, :new, :show] do
      member do
        get :reply
      end
    end
  end

  resources :password_resets,  only: [:new, :create, :edit, :update]
  resources :user_resets,  only: [:new]

  resources :posts do
    resources :comments, except: [:index, :new, :show] do
      member do
        get :reply
      end
    end
  end

  resources :static_page, path:"community" do
    collection do
        get :recent
        get :reply
    end
  end

  resources :relationships, only: [:create, :destroy]

  #resources :posts,  only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
