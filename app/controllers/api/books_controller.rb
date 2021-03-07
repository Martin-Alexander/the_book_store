module Api
  class BooksController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def index
      @books = policy_scope(Book).all
    end
  end
end