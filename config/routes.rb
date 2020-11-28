Rails.application.routes.draw do
  root 'sellinfos#new'
  resources :sellinfos
  resources :buyinfos
end
