Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  resources :appointments, except: :destroy
  resources :doctors, only: :index

  root "appointments#index"
end
