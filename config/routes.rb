Rails.application.routes.draw do
  root 'statics#home'
  resources :sellinfos
end
