Rails.application.routes.draw do

  root 'static_pages#home'

  get  '/informasi',    to: 'static_pages#informasi'
  get  '/data',         to: 'static_pages#data'
  get  '/ramalan',      to: 'static_pages#ramalan'
  get  '/info',         to: 'static_pages#info'
  get  '/about',        to: 'static_pages#about'

  resources :bnpbs
  resources :bmkgs
  resources :sosialmedias
  resources :twitters
  resources :kabupatens
  resources :provinsis
  resources :bencanas
end
