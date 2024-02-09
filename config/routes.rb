Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  resources :appointments, except: :destroy

  root "appointments#index"
end
