Rails.application.routes.draw do

  devise_for :users

  root 'static_pages#home'

  get  '/informasi',    to: 'static_pages#informasi'
  get  '/data',         to: 'static_pages#data'
  get  '/ramalan',      to: 'static_pages#ramalan'
  get  '/info',         to: 'static_pages#info'
  get  '/about',        to: 'static_pages#about'

  resources :polas do
    collection { post :import }
  end
  resources :stasiuns do
    collection { post :import }
  end
  resources :keywords do
    collection { post :import }
  end
  resources :bnpbs do
    collection { post :import }
  end
  resources :bmkgs do
    collection { post :import }
  end
  resources :sosialmedias do
    collection { post :import }
  end
  resources :twitters do
    collection { post :import }
  end
  resources :kabupatens do
    collection { post :import }
  end
  resources :provinsis do
    collection { post :import }
  end
  
  resources :bencanas do
    collection { post :import }
  end

end
