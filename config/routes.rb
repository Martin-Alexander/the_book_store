Rails.application.routes.draw do
  devise_for :users

  defaults format: :json do
    namespace :api do
      resources :book_stocks, only: [:index, :create, :update, :destroy]
    end
  end
end
