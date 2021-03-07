json.cache! @books do
  json.array! @books, partial: "api/books/book", as: :book
end