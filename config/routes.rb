Rails.application.routes.draw do
  get 'distances/index'
  root 'sellinfos#new'
  resources :sellinfos
  resources :buyinfos
end
