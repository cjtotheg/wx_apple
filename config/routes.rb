Rails.application.routes.draw do
  root 'wxes#index'
  resources 'wxes'
end
