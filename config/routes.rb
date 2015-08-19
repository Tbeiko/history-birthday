Rails.application.routes.draw do
  root to: 'events#index'
  post '/', to: 'events#index'
end
