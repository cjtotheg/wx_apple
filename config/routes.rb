Rails.application.routes.draw do
  resources :wxes
  root "wxes#index"
end
