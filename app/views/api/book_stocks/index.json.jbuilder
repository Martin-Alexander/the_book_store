json.cache! @books do
  json.array! @book_stocks, partial: "api/book_stocks/book_stock", as: :book_stock
end