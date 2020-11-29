Rails.application.routes.draw do
  root 'sellinfos#new'
  resources :sellinfos
  resources :buyinfos
  resources :distances
end
