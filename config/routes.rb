Rails.application.routes.draw do
  get 'dashbords/index'
  root 'dashbords#index'
  devise_for :users
  resources :profiles, only: %i[new create show]
  resources :cities, except: %i[new show]
  resources :cleaners, except: %i[new]
  get '/featching_cleaner', to: 'bookings#featching_cleaner'
  resources :bookings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
