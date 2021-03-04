Rails.application.routes.draw do
  defaults format: :json do
    namespace :api do
      resources :books, only: [] do
        resources :book_stocks, only: [:index, :create]
      end

      resources :book_stocks, only: [:update, :destroy]
    end
  end
end
