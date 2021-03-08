class DashboardsController < ApplicationController
  def show
    @user = current_user
    @book_stocks = policy_scope(current_user.book_store.book_stocks).all.includes(:book)
  end
end
