Rails.application.routes.draw do
  root 'sellinfos#new'
  resources :sellinfos
end
