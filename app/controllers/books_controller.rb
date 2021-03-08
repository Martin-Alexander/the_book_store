class BooksController < ApplicationController
  def index
    books = policy_scope(Book).all

    rows = books.map do |book|
      [
        book.id,
        book.title,
        book.created_at.strftime("%e/%m/%Y %l:%M:%S %p"),
        book.updated_at.strftime("%e/%m/%Y %l:%M:%S %p")
      ]
    end

    @table_data = {
      title: "All Books",
      search_input_placehodler: "Search among #{books.length} #{"book".pluralize(books.length)}",
      searchable_row_index: 1,
      headers: ["id", "title", "created at", "updated at"],
      rows: rows
    }
  end
end