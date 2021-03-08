json.id book_stock.id
json.stock_level book_stock.stock_level
json.in_stock book_stock.in_stock
json.created_at book_stock.created_at

json.book do
  json.id book_stock.book.id
  json.title book_stock.book.title
end