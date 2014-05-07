Webknowadmin::Application.routes.draw do


  root to: 'admin_users#home'

  # match '/index', to: 'static_pages#index', via: 'get'
  # resources :static_pages

  match '/signin', to: 'sessions#new', via: 'get'
  #match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signout', to: 'sessions#destroy', via: 'get'
  resources :sessions, only: [:new, :create, :destroy]
  # match '/sessions/new', to: 'sessions#new', via: 'get'



  resources :admin_users do
    collection do
      post :dbclear
    end
  end

  resources :admin_users do
    collection do
      post :dbdelete
    end
  end

  match '/admin_users_index', to: 'admin_users#index', via: 'get'  
  match '/admin_users_new', to: 'admin_users#new', via: 'get'  

  resources :admin_users





end
