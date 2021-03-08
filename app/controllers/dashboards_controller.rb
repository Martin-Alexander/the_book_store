class DashboardsController < ApplicationController
  def show
    @user = current_user

    book_stocks = policy_scope(current_user.book_store.book_stocks).all.includes(:book)

    rows = book_stocks.map do |book_stock|
      [
        book_stock.id,
        book_stock.book.title,
        book_stock.stock_level,
        book_stock.in_stock,
        book_stock.created_at.strftime("%e/%m/%Y %l:%M:%S %p"),
        book_stock.updated_at.strftime("%e/%m/%Y %l:%M:%S %p")
      ]
    end

    @table_data = {
      title: "Books in Stock",
      search_input_placehodler: "Search among #{book_stocks.length} #{"book".pluralize(book_stocks.length)}",
      searchable_row_index: 1,
      headers: ["id", "book", "stock level", "in stock", "created at", "updated at"],
      rows: rows
    }
  end
end
