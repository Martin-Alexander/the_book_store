module Api
  class BookStocksController < ApplicationController
    def index
      @book_stocks = policy_scope(BookStock).all
    end

    def create
      @book_stock = BookStock.new(book_stock_params)
      @book_stock.book_store = current_user.book_store

      authorize @book_stock

      if @book_stock.save
        render :show
      else
        render json: @book_stock.errors.messages, status: :unprocessable_entity
      end
    end

    def update
      @book_stock = BookStock.find(params[:id])

      authorize @book_stock

      if @book_stock.update(book_stock_params)
        render :show
      else
        render json: @book_stock.errors.messages, status: :unprocessable_entity
      end
    end

    def destroy
      @book_stock = BookStock.find(params[:id])

      authorize @book_stock

      @book_stock.destroy

      render json: { message: "success" }
    end

    private

    def book_stock_params
      params.require(:book_stock).permit(:book_id, :stock_level, :in_stock)
    end
  end
end