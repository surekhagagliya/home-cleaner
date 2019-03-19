Rails.application.routes.draw do

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

  get 'dashbords/index'
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :cities, only: %i[index create show update destroy]
      end
    end
  end

  devise_for :users
  resources :profiles, only: %i[new create show]
  resources :cities, except: %i[new show]
  resources :cleaners, except: %i[new]
  get '/featching_cleaner', to: 'bookings#featching_cleaner'
  resources :bookings, only: %i[index new create show]

  root 'dashbords#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
