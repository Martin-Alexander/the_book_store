require 'sidekiq-scheduler/web'
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  defaults format: :json do
    namespace :api do
      resources :book_stocks, only: [:index, :create, :update, :destroy]
      resources :books, only: [:index]
    end
  end

  resource :dashboard, only: [:show]
  resources :books, only: [:index]

  root to: "landing_pages#show", as: :landing_page
end
