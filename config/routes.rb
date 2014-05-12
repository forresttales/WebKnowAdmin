Webknowadmin::Application.routes.draw do


  root to: 'admin_users#home'

  
  match '/signin', to: 'sessions#new', via: 'get'
  #match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/signout', to: 'sessions#destroy', via: 'get'
  resources :sessions, only: [:new, :create, :destroy]



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



  get "static_pages/ajaxpostex"
  get "static_pages/serverside"
  get "static_pages/postjsonex"
  
  match '/JournalPosterPositions-1', to: 'journal1poster_positions#index', via: 'get'
  match '/JournalPosterCreate-1', to: 'journal1poster_positions#create', via: 'post'

  # match '/JournalPosterPositionsCoord', :to => 'journal1poster_positions#coord', :as => 'JournalPosterPositionsCoord', :via => [:post]
  # match '/publisher_journalposter_purchases/receipt', :to => 'publisher_journalposter_purchases#receipt', :as => 'publisher_journalposter_purchases_receipt', :via => [:get]
  
  # resources :journal1poster_positions do
    # collection do
      # post :demo_test_post
    # end
  # end

  # resources :journal1poster_positions do
    # collection do
      # post :coord
    # end
  # end
  
  resources :journal1poster_positions do
    collection do
      post :dbdelete
    end
  end
  
  # resources :journal1poster_positions do
    # member do
      # get 'coord'
    # end
  # end

  resources :journal1poster_positions





  match '/JournalPosterPositions-2', to: 'journal2poster_positions#index', via: 'get'
  resources :journal2poster_positions

  match '/JournalPosterPositions-3', to: 'journal3poster_positions#index', via: 'get'
  resources :journal3poster_positions

  match '/JournalPosterPositions-4', to: 'journal4poster_positions#index', via: 'get'
  resources :journal4poster_positions

  match '/JournalPosterPositions-5', to: 'journal5poster_positions#index', via: 'get'
  resources :journal5poster_positions




  match '/poster_map_1', to: 'journalposter__maps#index', via: 'get'
  resources :journalposter_maps








end
